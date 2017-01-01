#include "pok3r.h"
#include "zlog.h"

void setword(unsigned char *b, int i){
    b[0]=(i>>0)&0xff;
    b[1]=(i>>8)&0xff;
}

// From http://mdfs.net/Info/Comp/Comms/CRC16.htm
// CRC-CCITT
#define poly 0x1021
zu16 crc16(unsigned char *addr, zu64 size) {
    zu32 crc = 0;
    for(zu64 i = 0; i < size; ++i){             /* Step through bytes in memory */
        crc ^= (zu16)(addr[i] << 8);            /* Fetch byte from memory, XOR into CRC top byte*/
        for(int j = 0; j < 8; j++){             /* Prepare to rotate 8 bits */
            crc = crc << 1;                     /* rotate */
            if(crc & 0x10000)                   /* bit 15 was set (now bit 16)... */
                crc = (crc ^ poly) & 0xFFFF;    /* XOR with XMODEM polynomic and ensure CRC remains 16-bit value */
        }
    }
    return (zu16)crc;
}

Pok3r::Pok3r(ZPointer<USBDevice> dev) : device(dev){

}

Pok3r::~Pok3r(){

}

bool Pok3r::findPok3r(){
    // Try firmware vid and pid
    if(device->findUSBVidPid(HOLTEK_VID, POK3R_PID))
        return true;
    // Try builtin vid and pid
    if(device->findUSBVidPid(HOLTEK_VID, POK3R_BOOT_PID))
        return true;
    return false;
}

bool Pok3r::reboot(){
    LOG("Reset...");
    if(!reset(RESET_BOOT_SUBCMD)){
        ELOG("Reset send error");
        return false;
    }
    return true;
}

bool Pok3r::bootloader(){
    // Reset
    LOG("Reset...");
    if(!reset(RESET_BUILTIN_SUBCMD)){
        ELOG("Reset send error");
        return false;
    }

    LOG("Wait...");
    ZThread::sleep(3);

    // Close old handle
    device->close();

    // Find device with new loader vid and pid
    LOG("Find...");
    if(!device->findUSBVidPid(HOLTEK_VID, POK3R_BOOT_PID)){
        ELOG("Couldn't open device");
        return false;
    }

    // Open new handle
    LOG("Open...");
    if(!device->open()){
        ELOG("Open error");
        return false;
    }

    return true;
}

ZString Pok3r::getVersion(){
    ZBinary bin;
    if(readFlash(POK3R_VER_ADDR, bin)){
        return ZString(bin.raw() + 4);
    }
    return "NONE";
}

bool Pok3r::eraseFlash(zu32 start, zu32 end){
    // Send command
    if(!sendCmd(ERASE_CMD, 0, start, end, nullptr, 0))
        return false;
    return true;
}

bool Pok3r::readFlash(zu32 addr, ZBinary &bin){
    // Send command
    if(!sendCmd(FLASH_CMD, FLASH_READ_SUBCMD, addr, addr + 64, nullptr, 0))
        return false;

    // Get response
    zu64 pos = bin.size();
    bin.resize(bin.size() + 64);
    if(!recvDat(bin.raw() + pos))
        return false;

    return true;
}

bool Pok3r::writeFlash(zu32 addr, ZBinary bin){
    if(!bin.size())
        return false;
    // Send command
    if(!sendCmd(FLASH_CMD, FLASH_WRITE_SUBCMD, addr, addr + bin.size() - 1, bin.raw(), bin.size()))
        return false;
    return true;
}

bool Pok3r::updateStart(ZBinary &bin){
    // Send command
    if(!sendCmd(UPDATE_START_CMD, 0, 0, 0, nullptr, 0))
        return false;

    // Get response
    bin.resize(64);
    if(!recvDat(bin.raw()))
        return false;

    return true;
}

bool Pok3r::reset(zu8 subcmd){
    // Send command
    if(!sendCmd(RESET_CMD, subcmd, 0, 0, nullptr, 0))
        return false;
    return true;
}

zu16 Pok3r::crcFlash(zu32 addr, zu32 len){
    // Send command
    sendCmd(CRC_CMD, 0, addr, len, nullptr, 0);
    return 0;
}

bool Pok3r::sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data, zu8 len){
    if(!device.ptr() || len > 52)
        return false;

    ZBinary packet;
    packet.fill(0, PKT_LEN);
    packet.writeu8(cmd);      // command
    packet.writeu8(subcmd);   // subcommand
    packet.seek(4);
    packet.writeleu32(a1);    // arg1
    packet.writeleu32(a2);    // arg2

    if(data){
        packet.write(data, len);  // data
    }

    packet.seek(2);
    packet.writeleu16(crc16(packet.raw(), PKT_LEN)); // CRC

    // debug
//    RLOG(packet.dumpBytes(4, 8));

    // Send command (interrupt write)
    zu16 olen = device->interrupt_send(SEND_EP, packet.raw(), PKT_LEN);

    if(olen != PKT_LEN){
        ELOG("Failed to send: length " << olen);
        return false;
    }

    return true;
}

bool Pok3r::recvDat(zbyte *data){
    if(!device.ptr() || !data)
        return false;

    // Recv data (interrupt read)
    zu16 olen = device->interrupt_recv(RECV_EP, data, PKT_LEN);

    if(olen != PKT_LEN){
        ELOG("Failed to recv: length " << olen);
        return false;
    }

    // debug
//    RLOG(ZBinary(data, PKT_LEN).dumpBytes(4, 8));

    return true;
}

// POK3R firmware XOR encryption/decryption key
// Found at 0x2188 in Pok3r flash
static const zu32 xor_key[] = {
    0x55aa55aa,
    0xaa55aa55,
    0x000000ff,
    0x0000ff00,
    0x00ff0000,
    0xff000000,
    0x00000000,
    0xffffffff,
    0x0f0f0f0f,
    0xf0f0f0f0,
    0xaaaaaaaa,
    0x55555555,
    0x00000000,
};

// This array was painstakingly translated from a switch with a lot of shifts in the firmware.
// I noticed after the fact that it was identical to the array that Sprite used in his hack,
// but the groups of offsets were in a rotated order. Oh well.
const zu8 swap_key[] = {
    0,1,2,3,
    1,2,3,0,
    2,1,3,0,
    3,2,1,0,
    3,1,0,2,
    1,2,0,3,
    2,3,1,0,
    0,2,1,3,
};

void decode_firmware_packet(zbyte *data, zu32 num){
    zu32 *words = (zu32*)data;

    // XOR decryption
    for(int i = 0; i < 13; ++i){
        words[i] = words[i] ^ xor_key[i];
    }

    // Swap decryption
    zu8 f = (num & 7) << 2;
    for(int i = 0; i < 52; i+=4){
        zbyte a = data[i + swap_key[f + 0]];
        zbyte b = data[i + swap_key[f + 1]];
        zbyte c = data[i + swap_key[f + 2]];
        zbyte d = data[i + swap_key[f + 3]];

        data[i + 0] = a;
        data[i + 1] = b;
        data[i + 2] = c;
        data[i + 3] = d;
    }
}

// Decode the encryption scheme used by the POK3R firmware
// Ripped from the pok3r builtin firmware
void Pok3r::decode_firmware(ZBinary &bin){
    zu32 count = 0;
    for(zu32 offset = 0; offset < bin.size(); offset += 52){
        if(count >= 10 && count <= 100){
            decode_firmware_packet(bin.raw() + offset, count);
        }
        count++;
    }
}

void encode_firmware_packet(zbyte *data, zu32 num){
    zu32 *words = (zu32*)data;

    // Swap encryption
    zu8 f = (num & 7) << 2;
    for(int i = 0; i < 52; i+=4){
        zbyte a = data[i + 0];
        zbyte b = data[i + 1];
        zbyte c = data[i + 2];
        zbyte d = data[i + 3];

        data[i + swap_key[f + 0]] = a;
        data[i + swap_key[f + 1]] = b;
        data[i + swap_key[f + 2]] = c;
        data[i + swap_key[f + 3]] = d;
    }

    // XOR encryption
    for(int i = 0; i < 13; ++i){
        words[i] = words[i] ^ xor_key[i];
    }
}

// Encode using the encryption scheme used by the POK3R firmware
// Reverse engineered from the above
void Pok3r::encode_firmware(ZBinary &bin){
    zu32 count = 0;
    for(zu32 offset = 0; offset < bin.size(); offset += 52){
        if(count >= 10 && count <= 100){
            encode_firmware_packet(bin.raw() + offset, count);
        }
        count++;
    }
}
