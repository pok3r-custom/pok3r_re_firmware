#include "pok3r_rgb.h"
#include "zlog.h"

Pok3rRGB::Pok3rRGB(ZPointer<USBDevice> dev) : device(dev){

}

Pok3rRGB::~Pok3rRGB(){

}

bool Pok3rRGB::findPok3rRGB(){
    // Try firmware vid and pid
    if(device->findUSBVidPid(HOLTEK_VID, POK3R_RGB_PID))
        return true;
    return false;
}

bool Pok3rRGB::reboot(){
    LOG("Reset");
    if(!sendCmd(RESET, RESET_FW, 0, nullptr, 0))
        return false;
    device->close();
    return true;
//    LOG("Wait...");
//    ZThread::sleep(3);
//    if(!device->findUSBVidPid(HOLTEK_VID, POK3R_RGB_PID))
//        return false;
//    if(!device->open())
//        return false;
//    LOG("OK");
//    return true;
}

bool Pok3rRGB::bootloader(){
    LOG("Reset");
    if(!sendCmd(RESET, RESET_BL, 0, nullptr, 0))
        return false;
    device->close();
    return true;
//    LOG("Wait...");
//    ZThread::sleep(3);
//    if(!device->findUSBVidPid(HOLTEK_VID, POK3R_RGB_BOOT_PID))
//        return false;
//    if(!device->open())
//        return false;
//    LOG("OK");
//    return true;
}

ZString Pok3rRGB::getVersion(){
    ZBinary bin(PKT_LEN);
    if(!sendCmd(READ, 0x20, 0, nullptr, 0))
        return "ERROR";
    if(!recvDat(bin.raw()))
        return "ERROR";
    ZString ver;
    ver.parseUTF16((zu16 *)(bin.raw() + 8), 60);
    return ver;
}

ZBinary Pok3rRGB::dumpFlash(){
    ZBinary dump;
    for(zu16 i = 0; i < 0x10000 - 60; i += 60){
        ZBinary bin(PKT_LEN);
        if(!sendCmd(READ, 0xff, i, nullptr, 0))
            return dump;
        if(!recvDat(bin.raw()))
            return dump;

//        RLOG(bin.dumpBytes(4, 8));
        dump.write(bin.raw() + 4, 60);
    }
    return dump;
}

void Pok3rRGB::test(){
    ZBinary bin(PKT_LEN);
    if(!sendCmd(READ, READ_400, 0, nullptr, 0))
        return;
    if(!recvDat(bin.raw()))
        return;
    RLOG(bin.getSub(4, bin.size()-4).dumpBytes(4, 8));
}

bool Pok3rRGB::sendCmd(zu8 cmd, zu8 a1, zu16 a2, const zbyte *data, zu8 len){
    if(!device.ptr() || len > 52)
        return false;

    ZBinary packet;
    packet.fill(0, PKT_LEN);
    packet.writeu8(cmd);    // command
    packet.writeu8(a1);     // argument
    packet.writeleu16(a2);  // patch argument

    if(data){
        packet.write(data, len);  // data
    }

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

bool Pok3rRGB::recvDat(zbyte *data){
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
