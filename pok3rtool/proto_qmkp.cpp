#include "proto_qmkp.h"
#include "zlog.h"

#define UPDATE_PKT_LEN      32

#define VER_ADDR            0x2800
#define FW_ADDR             0x2c00

#define FLASH_LEN           0x20000

#define WAIT_SLEEP          2

ProtoQMKP::ProtoQMKP(zu16 vid_, zu16 pid_, zu16 boot_pid_) :
    builtin(false), debug(false), nop(false),
    vid(vid_), pid(pid_), boot_pid(boot_pid_),
    dev(new HIDDevice){

}

ProtoQMKP::ProtoQMKP(zu16 vid_, zu16 pid_, zu16 boot_pid_, bool builtin_, HIDDevice *dev_) :
    builtin(builtin_), debug(false), nop(false),
    vid(vid_), pid(pid_), boot_pid(boot_pid_),
    dev(dev_){

}

ProtoQMKP::~ProtoQMKP(){
    delete dev;
}

bool ProtoQMKP::open(){
    // Try firmware vid and pid
    if(dev->open(vid, pid, QMK_USAGE_PAGE, QMK_USAGE)){
        builtin = false;
        return true;
    }
    return false;
}

void ProtoQMKP::close(){
    dev->close();
}

bool ProtoQMKP::isOpen() const {
    return dev->isOpen();
}

bool ProtoQMKP::isBuiltin() const {
    return builtin;
}

bool ProtoQMKP::enterFirmware(){
    if(!builtin){
//        LOG("In Firmware");
        return true;
    }

    LOG("Reset to Firmware");
//    if(!sendCmd(RESET_CMD, RESET_BOOT_SUBCMD, 0, 0))
//        return false;

    close();
    ZThread::sleep(WAIT_SLEEP);

    // Find device with new vid and pid
    if(!open()){
        ELOG("open error");
        return false;
    }

    if(builtin)
        return false;
    return true;
}

bool ProtoQMKP::enterBootloader(){
    if(builtin){
//        LOG("In Bootloader");
        return true;
    }

    LOG("Reset to Bootloader");
//    if(!sendCmd(RESET_CMD, RESET_BUILTIN_SUBCMD, 0, 0))
//        return false;

    close();
    ZThread::sleep(WAIT_SLEEP);

    // Find device with new vid and pid
    if(!open()){
        ELOG("open error");
        return false;
    }

    if(!builtin)
        return false;
    return true;
}

bool ProtoQMKP::getInfo(){
//    if(!sendCmd(UPDATE_START_CMD, 0, 0, 0))
//        return false;

    ZBinary data(64);
    if(!dev->recv(data)){
        ELOG("recv error");
        return false;
    }
    DLOG("recv:");
    DLOG(ZLog::RAW << data.dumpBytes(4, 8));

    RLOG(data.dumpBytes(4, 8));

    zu32 a = data.readleu32();
    zu16 fw_addr = data.readleu16();
    zu16 page_size = data.readleu16();
    zu16 e = data.readleu16() + 10;
    zu16 f = data.readleu16() + 10;
    zu32 ver_addr = data.readleu32();

    LOG(ZString::ItoS((zu64)a, 16));
    LOG("firmware address: 0x" << ZString::ItoS((zu64)fw_addr, 16));
    LOG("page size?: 0x" << ZString::ItoS((zu64)page_size, 16));
    LOG(e);
    LOG(f);
    LOG("version_address: 0x" << ZString::ItoS((zu64)ver_addr, 16));

    return true;
}

ZString ProtoQMKP::getVersion(){
    ZBinary packet(UPDATE_PKT_LEN);
    for(zu8 i = 0; i < UPDATE_PKT_LEN; ++i){
        packet.writeu8(i);
    }
    if(!dev->send(packet, false)){
        ELOG("send error");
        return "ERR";
    }
    return "TEST";

    ZBinary bin;
    if(!readFlash(VER_ADDR, bin))
        return "ERROR";

    ZBinary tst;
    tst.fill(0xFF, 64);
    if(bin == tst)
        return "CLEARED";

    bin.rewind();
    zu32 len = MIN(bin.readleu32(), 64U);
    return ZString(bin.raw() + 4, len);
}

bool ProtoQMKP::clearVersion(){
    DLOG("clearVersion");
    if(!enterBootloader())
        return false;

    LOG("Clear Version");
    if(!eraseFlash(VER_ADDR, VER_ADDR + 8))
        return false;

    ZBinary bin;
    if(!readFlash(VER_ADDR, bin))
        return false;

    ZBinary tst;
    tst.fill(0xFF, 64);
    if(bin != tst)
        return false;

    return true;
}

bool ProtoQMKP::setVersion(ZString version){
    DLOG("setVersion " << version);
    if(!clearVersion())
        return false;

    LOG("Write Version: " << version);

    ZBinary vdata;
    zu64 vlen = version.size() + 4;
    vdata.fill(0, vlen + (4 - (vlen % 4)));
    vdata.writeleu32(version.size());
    vdata.write(version.bytes(), version.size());

    // write version
    if(!writeFlash(VER_ADDR, vdata)){
        LOG("write error");
        return false;
    }

    // check version
    ZString nver = getVersion();
    LOG("New Version: " << nver);

    if(nver != version){
        ELOG("failed to set version");
        return false;
    }

    return true;
}

ZBinary ProtoQMKP::dumpFlash(){
    ZBinary dump;
    for(zu32 i = 0; i < FLASH_LEN; i += 64){
        if(!readFlash(i, dump))
            break;
    }
    return dump;
}

bool ProtoQMKP::writeFirmware(const ZBinary &fwbinin){
    ZBinary fwbin = fwbinin;

    // update reset
//    if(!sendCmd(UPDATE_START_CMD, 0, 0, 0))
//        return false;
    ZBinary data(UPDATE_PKT_LEN);
    if(!dev->recv(data)){
        ELOG("recv error");
        return false;
    }
    DLOG("recv:");
    DLOG(ZLog::RAW << data.dumpBytes(4, 8));

    LOG("Erase...");
    if(!eraseFlash(FW_ADDR, FW_ADDR + fwbin.size())){
//    if(!eraseFlash(VER_ADDR, 0xA108)){
        ELOG("erase error");
        return false;
    }

    ZThread::sleep(WAIT_SLEEP);

    // Write firmware
    LOG("Write...");
    for(zu64 o = 0; o < fwbin.size(); o += 52){
        ZBinary packet;
        fwbin.read(packet, 52);
        if(!writeFlash(FW_ADDR + o, packet)){
            LOG("error writing: 0x" << ZString::ItoS(FW_ADDR + o, 16));
            return false;
        }
    }

    fwbin.rewind();

    LOG("Check...");
    for(zu64 o = 0; o < fwbin.size(); o += 52){
        ZBinary packet;
        fwbin.read(packet, 52);
        if(!checkFlash(FW_ADDR + o, packet)){
            LOG("error checking: 0x" << ZString::ItoS(FW_ADDR + o, 16));
            return false;
        }
    }

    // update reset?
//    if(!sendCmd(UPDATE_START_CMD, 0, 0, 0)){
//        return false;
//    }
    if(!dev->recv(data)){
        ELOG("recv error");
        return false;
    }
    DLOG("recv:");
    DLOG(ZLog::RAW << data.dumpBytes(4, 8));

    return true;
}

bool ProtoQMKP::update(ZString version, const ZBinary &fwbin){
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

bool ProtoQMKP::eraseFlash(zu32 start, zu32 end){
    DLOG("eraseFlash " << start << " " << end);
    // Send command
//    if(!sendCmd(ERASE_CMD, 8, start, end))
//        return false;
    return true;
}

bool ProtoQMKP::readFlash(zu32 addr, ZBinary &bin){
    DLOG("readFlash " << addr);
    // Send command
//    if(!sendCmd(FLASH_CMD, FLASH_READ_SUBCMD, addr, addr + 64))
//        return false;

    // Get response
    ZBinary pkt(UPDATE_PKT_LEN);
    if(!dev->recv(pkt)){
        ELOG("recv error");
        return false;
    }
    DLOG("recv:");
    DLOG(ZLog::RAW << pkt.dumpBytes(4, 8));

    bin.write(pkt);
    return true;
}

bool ProtoQMKP::writeFlash(zu32 addr, ZBinary bin){
    DLOG("writeFlash " << addr << " " << bin.size());
    if(!bin.size())
        return false;
    // Send command
//    if(!sendCmd(FLASH_CMD, FLASH_WRITE_SUBCMD, addr, addr + bin.size() - 1, bin.raw(), bin.size()))
//        return false;
    return true;
}

bool ProtoQMKP::checkFlash(zu32 addr, ZBinary bin){
    DLOG("checkFlash " << addr << " " << bin.size());
    if(!bin.size())
        return false;
    // Send command
//    if(!sendCmd(FLASH_CMD, FLASH_CHECK_SUBCMD, addr, addr + bin.size() - 1, bin.raw(), bin.size()))
//        return false;
    return true;
}

zu16 ProtoQMKP::crcFlash(zu32 addr, zu32 len){
    // Send command
//    sendCmd(CRC_CMD, 0, addr, len);
    return 0;
}

bool ProtoQMKP::sendCmd(zu8 cmd, zu8 subcmd, zu32 a1, zu32 a2, const zbyte *data, zu8 len){
    if(len > 52){
        ELOG("bad data size");
        return false;
    }

    ZBinary packet(UPDATE_PKT_LEN);
    packet.fill(0);
    packet.writeu8(cmd);      // command
    packet.writeu8(subcmd);   // subcommand
    packet.seek(4);
    packet.writeleu32(a1);    // arg1
    packet.writeleu32(a2);    // arg2

    if(data){
        packet.write(data, len);  // data
    }

    packet.seek(2);
//    packet.writeleu16(crc16(packet.raw(), UPDATE_PKT_LEN)); // CRC

    DLOG("send:");
    DLOG(ZLog::RAW << packet.dumpBytes(4, 8));

    // Send command (interrupt write)

    if(!dev->send(packet, false)){
        ELOG("send error");
        return false;
    }
    return true;
}
