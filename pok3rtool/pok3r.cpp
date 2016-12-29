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

bool Pok3r::findPok3r(){
    // Try firmware vid and pid
    if(findUSBVidPid(HOLTEK_VID, POK3R_PID))
        return true;
    // Try builtin vid and pid
    if(findUSBVidPid(HOLTEK_VID, POK3R_BOOT_PID))
        return true;
    return false;
}

bool Pok3r::resetToLoader(){
    // Reset
    LOG("Reset...");
    if(!reset(RESET_BUILTIN_SUBCMD)){
        ELOG("Reset send error");
        return false;
    }

    LOG("Wait...");
    ZThread::sleep(3);

    // Close old handle
    close();

    // Find device with new loader vid and pid
    LOG("Find...");
    if(!findUSBVidPid(HOLTEK_VID, POK3R_BOOT_PID)){
        ELOG("Couldn't open device");
        return false;
    }

    // Open new handle
    LOG("Open...");
    if(!open()){
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
    if(len > 52)
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
    zu16 olen = interrupt_send(SEND_EP, packet.raw(), PKT_LEN);

    if(olen != PKT_LEN){
        ELOG("Failed to send: length " << olen);
        return false;
    }

    return true;
}

bool Pok3r::recvDat(zbyte *data){
    if(!data)
        return false;

    // Recv data (interrupt read)
    zu16 olen = interrupt_recv(RECV_EP, data, PKT_LEN);

    if(olen != PKT_LEN){
        ELOG("Failed to recv: length " << olen);
        return false;
    }

    // debug
//    RLOG(ZBinary(data, PKT_LEN).dumpBytes(4, 8));

    return true;
}


