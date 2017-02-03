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
//        LOG("In Firmware");
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
//        LOG("In Bootloader");
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

bool Pok3rRGB::getInfo(){
    ZBinary bin;

    for(zu8 i = 0x20; i < 0x31; ++i){
        ZBinary data;
        if(!sendRecvCmd(READ, i, data))
            return false;
        bin.write(data.getSub(4, 60));
    }

    RLOG(bin.dumpBytes(4, 8, VER_ADDR));

    return true;
}

ZString Pok3rRGB::getVersion(){
    ZBinary data;

    // version 1
    data.clear();
    if(!sendRecvCmd(READ, READ_VER1, data))
        return "ERROR";
//    RLOG(data.dumpBytes(4, 8));

    ZBinary tst;
    tst.fill(0xFF, 60);

    ZString ver;
    if(data.getSub(4) == tst){
        ver = "CLEARED";
    } else {
        ver.parseUTF16((zu16 *)(data.raw() + 8), 60);
    }

    // version 2
//    data.clear();
//    if(!sendRecvCmd(READ, READ_VER2, data))
//        return "ERROR";
//    RLOG(data.dumpBytes(4, 8));

    return ver;
}

bool Pok3rRGB::clearVersion(){
    DLOG("clearVersion");
    if(!enterBootloader())
        return false;

    if(!eraseFlash(VER_ADDR, 0xB4))
        return false;

    ZBinary data;
    if(!sendRecvCmd(READ, READ_VER2, data))
        return false;

    ZBinary tst;
    tst.fill(0xFF, 60);
    if(data.getSub(4) != tst){
        ELOG("version not cleared");
        return false;
    }

    return true;
}

const zu32 ver2[15] = {
    0x00800004, 0x00010300, 0x00000041, 0xefffffff,
    0x00000001, 0x00000000, 0x016704d9, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0x001c5aa5,
};

bool Pok3rRGB::setVersion(ZString version){
    DLOG("setVersion " << version);
    if(!clearVersion())
        return false;

    LOG("Write Version: " << version);

    zu16 str[256];
    zu64 len = version.readUTF16(str, 255);
    str[len++] = 0;

    ZBinary sdata;
    sdata.writeleu32(len * 2);
    for(zu64 i = 0; i < len; ++i)
        sdata.writeleu16(str[i]);

    ZBinary vdata;
    vdata.fill(0xFF, 0x78);
    vdata.write(sdata);
    vdata.seek(0x78);
    vdata.write((const zbyte *)ver2, sizeof(ver2));
//    RLOG(vdata.dumpBytes(4, 8));

    // write version
    if(!writeFlash(VER_ADDR, vdata)){
        ELOG("write error");
        return false;
    }

    // check version
    ZBinary data;
    if(!sendRecvCmd(READ, READ_VER2, data))
        return false;
    ZBinary cdata(ver2, sizeof(ver2));
    if(data.getSub(4) != cdata){
        ELOG("failed to set version");
        return false;
    }

    ZString nver = getVersion();
    LOG("New Version: " << nver);
    if(nver != version){
        ELOG("failed to set version string");
        return false;
    }

    return true;
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

bool Pok3rRGB::writeFirmware(const ZBinary &fwbinin){
    ZBinary fwbin = fwbinin;
    // Encode the firmware for the POK3R RGB
    encode_firmware(fwbin);

//    zu32 ccrc = crcFlash(FW_ADDR, 0xc000);
    zu32 ccrc = crcFlash(FW_ADDR, fwbin.size());
    LOG("Current CRC: " << ZString::ItoS((zu64)ccrc, 16, 8));

    zu32 crc1 = ZHash<ZBinary, ZHashBase::CRC32>(fwbin).hash();
    LOG("New CRC: " << ZString::ItoS((zu64)crc1, 16, 8));

    LOG("Erase...");
    if(!eraseFlash(FW_ADDR, fwbin.size()))
        return false;

    ZThread::sleep(WAIT_SLEEP);

    LOG("Write...");
    if(!writeFlash(FW_ADDR, fwbin))
        return false;

    zu32 crc2 = crcFlash(FW_ADDR, fwbin.size());
    LOG("Firmware CRC: " << ZString::ItoS((zu64)crc1, 16, 8));

    if(crc2 != crc1){
        ELOG("crc mismatch");
        return false;
    }

    return true;
}

bool Pok3rRGB::update(ZString version, const ZBinary &fwbin){
    // Reset to bootloader
    if(!enterBootloader())
        return false;

    LOG("Current Version: " << getVersion());

    if(!clearVersion())
        return false;

    if(!writeFirmware(fwbin))
        return false;

    if(!setVersion(version))
        return false;

    // Reset to firmware
    if(!enterFirmware())
        return false;
    return true;

}

void Pok3rRGB::test(){
    ZBinary bin;

    LOG("READ_400");
    bin.clear();
    if(!sendRecvCmd(READ, READ_400, bin))
        return;
    RLOG(bin.getSub(4, 52).dumpBytes(4, 8));

    LOG("READ_3c00");
    bin.clear();
    if(!sendRecvCmd(READ, READ_3C00, bin))
        return;
    RLOG(bin.getSub(4, 4).dumpBytes(4, 8));

    LOG("READ_MODE");
    bin.clear();
    if(!sendRecvCmd(READ, READ_MODE, bin))
        return;
    RLOG(bin.getSub(4, 1).dumpBytes(4, 8));

    if(!enterBootloader())
        return;

    LOG("READ_MODE");
    bin.clear();
    if(!sendRecvCmd(READ, READ_MODE, bin))
        return;
    RLOG(bin.getSub(4, 1).dumpBytes(4, 8));

    ZBinary data;
    data.writeleu32(0x400);
    data.writeleu32(0x4da4);

    LOG("SUM");
    if(!sendCmd(FW, FW_SUM, 0, data))
        return;
    if(!recv(bin))
        return;
    bin.rewind();
    bin.seek(4);
    zu32 sum = bin.readleu32();
    LOG("SUM " << ZString::ItoS((zu64)sum, 16));

    LOG("CRC");
    if(!sendCmd(FW, FW_CRC, 0, data))
        return;
    if(!recv(bin))
        return;
    bin.rewind();
    bin.seek(4);
    LOG("CRC " << ZString::ItoS((zu64)bin.readleu32(), 16));
}

bool Pok3rRGB::eraseFlash(zu32 start, zu32 length){
    DLOG("eraseFlash " << start << " " << length);
    if(start < VER_ADDR){
        ELOG("bad address");
        return false;
    }

    ZBinary data;
    data.writeleu32(start - VER_ADDR);
    data.writeleu32(length);

    if(!sendRecvCmd(FW, FW_ERASE, data))
        return false;

    return true;
}

bool Pok3rRGB::readFlash(zu32 addr, ZBinary &bin){
    DLOG("readFlash " << addr);
    ZBinary data;
    if(!sendRecvCmd(READ, READ_ADDR, data, addr))
        return false;

    bin.write(data.raw() + 4, 60);
    return true;
}

bool Pok3rRGB::writeFlash(zu32 addr, ZBinary bin){
    DLOG("writeFlash " << addr << " " << bin.size());
    if(addr < VER_ADDR){
        ELOG("bad address");
        return false;
    }

    // Set address
    ZBinary adata;
    adata.writeleu32(addr - VER_ADDR);
    if(!sendRecvCmd(ADDR, ADDR_SET, adata))
        return false;

    // Get address
    adata.clear();
    if(!sendRecvCmd(ADDR, ADDR_GET, adata))
        return false;
    adata.seek(4);
    zu32 saddr = adata.readleu32();

    if(saddr != addr - VER_ADDR){
        ELOG("failed to set write address");
        return false;
    }

    // Write
    bin.rewind();
    while(!bin.atEnd()){
        ZBinary data;
        bin.read(data, 52);
        if(!sendRecvCmd(WRITE, data.size(), data))
            return false;
    }

    return true;
}

zu32 Pok3rRGB::crcFlash(zu32 addr, zu32 len){
    if(addr < VER_ADDR){
        ELOG("bad address");
        return 0;
    }

    DLOG("crcFlash " << addr << " " << len);

    ZBinary data;
    data.writeleu32(addr - VER_ADDR);
    data.writeleu32(len);

    // CRC command
    if(!sendRecvCmd(FW, FW_CRC, data))
        return 0;

    data.seek(4);
    return data.readleu32();
}

bool Pok3rRGB::sendCmd(zu8 cmd, zu8 a1, zu16 a2, ZBinary data){
    if(data.size() > 52){
        ELOG("bad data size");
        return false;
    }

    ZBinary packet(UPDATE_PKT_LEN);
    packet.fill(0);
    packet.writeu8(cmd);    // command
    packet.writeu8(a1);     // argument
    packet.writeleu16(a2);  // patch argument
    packet.write(data);     // data

    DLOG("send:");
    DLOG(ZLog::RAW << packet.dumpBytes(4, 8));

    // Send packet
    if(!send(packet)){
        ELOG("send error");
        return false;
    }
    return true;
}

bool Pok3rRGB::sendRecvCmd(zu8 cmd, zu8 a1, ZBinary &data, zu16 a2){
    if(!sendCmd(cmd, a1, a2, data))
        return false;

    // Recv packet
    data.resize(UPDATE_PKT_LEN);
    if(!recv(data)){
        ELOG("recv error");
        return false;
    }

    DLOG("recv:");
    DLOG(ZLog::RAW << data.dumpBytes(4, 8));

    // Check error
    data.rewind();
    if(data.readleu16() == UPDATE_ERROR){
        ELOG("error response");
        ELOG(ZLog::RAW << data.dumpBytes(4, 8));
        return false;
    }
    data.rewind();

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
