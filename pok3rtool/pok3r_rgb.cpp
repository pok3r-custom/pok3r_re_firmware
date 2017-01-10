#include "pok3r_rgb.h"
#include "zlog.h"

#define UPDATE_USAGE_PAGE   0xff00
#define UPDATE_USAGE        0x01
#define UPDATE_PKT_LEN      64

#define UPDATE_ERROR        0xaaff

#define VER_ADDR            0x3000
#define FW_ADDR             0x3400

#define FLASH_LEN           0x10000

#define WAIT_SLEEP          2

Pok3rRGB::Pok3rRGB() : debug(false), nop(false){

}

Pok3rRGB::~Pok3rRGB(){

}

bool Pok3rRGB::open(){
    // Try firmware vid and pid
    if(HIDDevice::open(HOLTEK_VID, POK3R_RGB_PID, UPDATE_USAGE_PAGE, UPDATE_USAGE)){
        LOG("Opened POK3R RGB");
        builtin = false;
        return true;
    }
    // Try builtin vid and pid
    if(HIDDevice::open(HOLTEK_VID, POK3R_RGB_BOOT_PID, UPDATE_USAGE_PAGE, UPDATE_USAGE)){
        LOG("Opened POK3R RGB (builtin)");
        builtin = true;
        return true;
    }
    return false;
}

bool Pok3rRGB::enterFirmware(){
    if(!builtin){
        LOG("In Firmware");
        return true;
    }

    LOG("Reset to Firmware");
    if(!sendCmd(RESET, RESET_FW))
        return false;

    close();
    ZThread::sleep(WAIT_SLEEP);

    if(!open()){
        ELOG("open error");
        return false;
    }

    if(builtin)
        return false;
    return true;
}

bool Pok3rRGB::enterBootloader(){
    if(builtin){
        LOG("In Bootloader");
        return true;
    }

    LOG("Reset to Bootloader");
    if(!sendCmd(RESET, RESET_BL))
        return false;

    close();
    ZThread::sleep(WAIT_SLEEP);

    if(!open()){
        ELOG("open error");
        return false;
    }

    if(!builtin)
        return false;
    return true;
}

ZString Pok3rRGB::getVersion(){
    ZBinary packet(UPDATE_PKT_LEN);

    // version 1
    if(!sendCmd(READ, READ_VER1)){
        return "ERROR";
    }
    if(!recv(packet)){
        ELOG("recv error");
        return "ERROR";
    }

    ZBinary tst;
    tst.fill(0xFF, 60);

    ZString ver;
    if(packet.getSub(4) == tst){
        ver = "CLEARED";
    } else {
        ver.parseUTF16((zu16 *)(packet.raw() + 8), 60);
    }

    // version 2
    if(!sendCmd(READ, READ_VER2)){
        return "ERROR";
    }
    if(!recv(packet)){
        ELOG("recv error");
        return "ERROR";
    }
    RLOG(packet.dumpBytes(4, 8));

    return ver;
}

ZBinary Pok3rRGB::dumpFlash(){
    ZBinary dump;
    for(zu16 i = 0; i < FLASH_LEN - 60; i += 60){
        if(!readFlash(i, dump))
            return dump;
    }

    // readable flash is not a multiple of 60,
    // so read the last little bit for a full dump

    ZBinary tmp;
    if(!readFlash(FLASH_LEN - 60, tmp))
        return dump;
    dump.write(tmp.raw() + 44, 16);

    return dump;
}

bool Pok3rRGB::updateFirmware(ZString version, const ZBinary &fwbinin){
    ZBinary fwbin = fwbinin;
    ZBinary data(UPDATE_PKT_LEN);

    if(!enterBootloader())
        return false;

    LOG("Old Version: " << getVersion());

    LOG("Erase...");
    if(!sendCmd(CMD_29, 0)){
        ELOG("erase send error");
        return false;
    }
    ZThread::sleep(WAIT_SLEEP);
    if(!recv(data)){
        ELOG("erase recv error");
        return false;
    }
    if(data.readleu16() == UPDATE_ERROR){
        ELOG("erase error");
        return false;
    }

    // Encode the firmware for the POK3R RGB
    encode_firmware(fwbin);


    return false;
}

void Pok3rRGB::test(){
    ZBinary bin(UPDATE_PKT_LEN);
    LOG("READ_400");
    if(!sendCmd(READ, READ_400))
        return;
    if(!recv(bin))
        return;
    RLOG(bin.getSub(4, 52).dumpBytes(4, 8));

    LOG("READ_3c00");
    if(!sendCmd(READ, READ_3C00))
        return;
    if(!recv(bin))
        return;
    RLOG(bin.getSub(4, 4).dumpBytes(4, 8));

    LOG("READ_2");
    if(!sendCmd(READ, READ_2))
        return;
    if(!recv(bin))
        return;
    RLOG(bin.getSub(4, 1).dumpBytes(4, 8));

    if(!enterBootloader())
        return;

    ZBinary data;
    data.writeleu32(0x400);
    data.writeleu32(0x4da4);

    LOG("SUM");
    if(!sendCmd(CMD_29, CMD_29_SUM, 0, data))
        return;
    if(!recv(bin))
        return;
    RLOG(bin.dumpBytes(4, 8));

    LOG("CRC");
    if(!sendCmd(CMD_29, CMD_29_CRC, 0, data))
        return;
    if(!recv(bin))
        return;
    RLOG(bin.dumpBytes(4, 8));

}

bool Pok3rRGB::eraseFlash(zu32 start, zu32 end){
    return false;
}

bool Pok3rRGB::readFlash(zu32 addr, ZBinary &bin){
    // Send command
    if(!sendCmd(READ, READ_ADDR, addr))
        return false;

    // Get response
    ZBinary pkt(UPDATE_PKT_LEN);
    if(!recv(pkt)){
        ELOG("recv error");
        return false;
    }

    // Check error
    if(pkt.readleu16() == UPDATE_ERROR){
        ELOG("error response");
        ELOG(ZLog::RAW << pkt.dumpBytes(4, 8));
        return false;
    }

    bin.write(pkt.raw() + 4, 60);
    return true;
}

bool Pok3rRGB::writeFlash(zu32 addr, ZBinary bin){
    return false;
}

bool Pok3rRGB::sendCmd(zu8 cmd, zu8 a1, zu16 a2, ZBinary data){
    if(data.size() > 52)
        return false;

    ZBinary packet(UPDATE_PKT_LEN);
    packet.fill(0);
    packet.writeu8(cmd);    // command
    packet.writeu8(a1);     // argument
    packet.writeleu16(a2);  // patch argument
    packet.write(data);     // data

    if(debug){
        DLOG(ZLog::RAW << packet.dumpBytes(4, 8));
    }

    if(!nop){
        // Send command (interrupt write)
        if(!send(packet)){
            ELOG("send error");
            return false;
        }
    }
    return true;
}

// POK3R RGB XOR encryption/decryption key
// Somone somewhere thought a random XOR key was any better than the one they
// used in the POK3R firmware. Yeah, good one.
// See fw_xor_decode.c for the hilarious way this key was obtained.
static const zu32 xor_key[] = {
    0xe7c29474,
    0x79084b10,
    0x53d54b0d,
    0xfc1e8f32,
    0x48e81a9b,
    0x773c808e,
    0xb7483552,
    0xd9cb8c76,
    0x2a8c8bc6,
    0x0967ada8,
    0xd4520f5c,
    0xd0c3279d,
    0xeac091c5,
};

// Decode the encryption scheme used by the POK3R RGB firmware
// Just XOR encryption with 52-byte key seen above.
void xor_decode_encode(ZBinary &bin){
    // XOR decryption
    zu32 *words = (zu32 *)bin.raw();
    for(zu64 i = 0; i < bin.size() / 4; ++i){
        words[i] = words[i] ^ xor_key[i % 13];
    }
}

void Pok3rRGB::decode_firmware(ZBinary &bin){
    xor_decode_encode(bin);
}

void Pok3rRGB::encode_firmware(ZBinary &bin){
    xor_decode_encode(bin);
}
