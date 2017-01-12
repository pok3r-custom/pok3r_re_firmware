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
    if(!enterBootloader())
        return false;

    LOG("Clear Version");
    if(!eraseFlash(VER_ADDR, 0xB4))
        return false;

    ZBinary data;
    if(!sendRecvCmd(READ, READ_VER2, data))
        return false;
//    RLOG(data.dumpBytes(4, 8));

    ZBinary tst;
    tst.fill(0xFF, 60);
    if(data.getSub(4) != tst)
        return false;

    return true;
}

const zu32 ver2[15] = {
    0x00800004, 0x00010300, 0x00000041, 0xefffffff,
    0x00000001, 0x00000000, 0x016704d9, 0xffffffff,
    0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
    0xffffffff, 0xffffffff, 0x001c5aa5
};

bool Pok3rRGB::setVersion(ZString version){
    LOG("Old Version: " << getVersion());

    if(!clearVersion())
        return false;

    LOG("Write Version: " << version);

    zu16 str[256];
    zu64 len = version.readUTF16(str, 256);

    ZBinary sdata;
    sdata.writeleu32((len * 2) + 10);
    for(zu64 i = 0; i < len; ++i)
        sdata.writeleu16(str[i]);
    sdata.writeleu32(0);
    sdata.writeleu32(0);
    sdata.writeleu16(0);

    ZBinary vdata;
    vdata.fill(0xFF, 0x78);
    vdata.write(sdata);
    vdata.seek(0x78);
    vdata.write((const zbyte *)ver2, sizeof(ver2));
    RLOG(vdata.dumpBytes(4, 8));

    if(!writeFlash(VER_ADDR, vdata)){
        ELOG("write error");
        return false;
    }

    LOG("New Version: " << getVersion());

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

static uint32_t crc32_tab[] = {
    0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
    0xe963a535, 0x9e6495a3,	0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
    0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
    0xf3b97148, 0x84be41de,	0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
    0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,	0x14015c4f, 0x63066cd9,
    0xfa0f3d63, 0x8d080df5,	0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
    0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,	0x35b5a8fa, 0x42b2986c,
    0xdbbbc9d6, 0xacbcf940,	0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
    0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
    0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
    0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,	0x76dc4190, 0x01db7106,
    0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
    0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
    0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
    0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
    0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
    0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
    0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
    0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
    0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
    0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
    0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
    0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
    0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
    0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
    0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
    0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
    0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
    0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
    0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
    0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
    0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
    0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
    0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
    0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
    0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
    0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
    0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
    0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
    0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
    0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
    0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
    0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
};

zu32 crc32(zu32 crc, const zbyte*buf, size_t size){
    const uint8_t *p = buf;
    crc = crc ^ ~0U;

    while (size--)
        crc = crc32_tab[(crc ^ *p++) & 0xFF] ^ (crc >> 8);

    return crc ^ ~0U;
}

zu8 birb(zu8 a){
    a = ((a & 0x01) << 7) |
        ((a & 0x02) << 5) |
        ((a & 0x04) << 3) |
        ((a & 0x08) << 1) |
        ((a & 0x10) >> 1) |
        ((a & 0x20) >> 3) |
        ((a & 0x40) >> 5) |
        ((a & 0x80) >> 7);
    return a;
}

zu32 birw(zu32 w){
    ((zu8*)&w)[0] = birb(((zu8*)&w)[0]);
    ((zu8*)&w)[1] = birb(((zu8*)&w)[1]);
    ((zu8*)&w)[2] = birb(((zu8*)&w)[2]);
    ((zu8*)&w)[3] = birb(((zu8*)&w)[3]);
    return w;
}

zu32 byrw(zu32 w){
    zbyte b[4];
    b[0] =((zu8*)&w)[3];
    b[1] =((zu8*)&w)[2];
    b[2] =((zu8*)&w)[1];
    b[3] =((zu8*)&w)[0];
    ((zu8*)&w)[0] = b[0];
    ((zu8*)&w)[1] = b[1];
    ((zu8*)&w)[2] = b[2];
    ((zu8*)&w)[3] = b[3];
    return w;
}

const zu32 crc_table[] =
{
    0x4DBDF21C, 0x500AE278, 0x76D3D2D4, 0x6B64C2B0,
    0x3B61B38C, 0x26D6A3E8, 0x000F9344, 0x1DB88320,
    0xA005713C, 0xBDB26158, 0x9B6B51F4, 0x86DC4190,
    0xD6D930AC, 0xCB6E20C8, 0xEDB71064, 0xF0000000
};

zu32 crc32_2(zu32 crc, const zbyte *data, zu64 size, zu8 fl){
    ZBinary fw(data, size);
    ZBinary fw2;
    while(!fw.atEnd()){
        zu32 w = fw.readleu32();
//        w = birw(w);
        if(fl & 0x08) w = byrw(w);
        fw2.writeleu32(w);
    }

    for(zu64 n = 0; n < size; n++){
        zbyte d = fw2[n];
        if(fl & 0x04) d = birb(d);
        if(fl & 0x10) d = ~d;

        crc = (crc >> 4) ^ crc_table[(crc ^ (d >> 0)) & 0x0F];  /* lower nibble */
        crc = (crc >> 4) ^ crc_table[(crc ^ (d >> 4)) & 0x0F];  /* upper nibble */

        if(fl & 0x20) crc = birw(crc);
        if(fl & 0x40) crc = byrw(crc);
        if(fl & 0x80) crc = ~crc;
    }

    return crc;
}

bool Pok3rRGB::updateFirmware(ZString version, const ZBinary &fwbinin){
    ZBinary fwbin = fwbinin;

//    zu32 pcrc = ZHash<ZBinary>(fwbin).hash();
//    zu32 pcrc = crc32(ZU32_MAX, fwbin.raw(), fwbin.size());
    zu32 pcrc = crc32_2(ZU32_MAX, fwbin.raw(), fwbin.size(), 0);
    LOG("pre1   " << ZString::ItoS((zu64)pcrc, 16, 8) << " " << ZString::ItoS((zu64)pcrc, 2, 32));
    pcrc = crc32_2(ZU32_MAX, fwbin.raw(), fwbin.size(), 0xe6);
    LOG("pre2   " << ZString::ItoS((zu64)pcrc, 16, 8) << " " << ZString::ItoS((zu64)pcrc, 2, 32));

    // Encode the firmware for the POK3R RGB
    encode_firmware(fwbin);

    ZBinary fw2;
    while(!fwbin.atEnd()){
        zu32 w = fwbin.readleu32();
//        w = birw(w);
//        w = byrw(w);
        fw2.writeleu32(w);
    }

//    zu32 crc2 = 0xad0455d7;
    zu32 test = 0x3e0530db;
    LOG("test   " << ZString::ItoS((zu64)test, 16, 8) << " " << ZString::ItoS((zu64)test, 2, 32));

    for(zu8 f = 0; f < 0x3f; ++f){
        zu32 crc = crc32_2(ZU32_MAX, fwbin.raw(), fwbin.size(), f << 2);
        LOG("crc " <<
            ZString::ItoS((zu64)(f << 2), 16, 2) << " " <<
            ZString::ItoS((zu64)crc, 16, 8) << " " <<
            ZString::ItoS((zu64)crc, 2, 32) << " " <<
            (crc == test));
    }

    return true;

    if(!enterBootloader())
        return false;

    LOG("Old Version: " << getVersion());

    if(!clearVersion())
        return false;

    LOG("Erase...");
    if(!eraseFlash(FW_ADDR, fwbin.size()))
//    if(!eraseFlash(FW_ADDR, 0xcc00))
        return false;

    ZThread::sleep(WAIT_SLEEP);

    LOG("Write...");
    if(!writeFlash(FW_ADDR, fwbin))
        return false;

    ZBinary data;
    data.writeleu32(FW_ADDR - VER_ADDR);
    data.writeleu32(fwbin.size());
    if(!sendRecvCmd(FW, FW_SUM, data))
        return false;
    RLOG(data.dumpBytes(4, 8));

    if(!setVersion(version))
        return false;

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
    ZBinary data;
    if(!sendRecvCmd(READ, READ_ADDR, data, addr))
        return false;

    bin.write(data.raw() + 4, 60);
    return true;
}

bool Pok3rRGB::writeFlash(zu32 addr, ZBinary bin){
    if(addr < VER_ADDR){
        ELOG("bad address");
        return false;
    }

    ZBinary adata;

    // Set address
    adata.writeleu32(addr - VER_ADDR);
    if(!sendRecvCmd(ADDR, ADDR_SET, adata))
        return false;

    adata.clear();
//    adata.writeleu32(ZU32_MAX);
    if(!sendRecvCmd(ADDR, ADDR_GET, adata))
        return false;

    bin.rewind();
    while(!bin.atEnd()){
        ZBinary data;
        bin.read(data, 52);
        if(!sendRecvCmd(WRITE, data.size(), data))
            return false;
    }

    return true;
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
        LOG("send");
        LOG(ZLog::RAW << packet.dumpBytes(4, 8));
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

bool Pok3rRGB::sendRecvCmd(zu8 cmd, zu8 a1, ZBinary &data, zu16 a2){
    if(!sendCmd(cmd, a1, a2, data))
        return false;

    if(nop)
        return true;

    data.resize(UPDATE_PKT_LEN);
    if(!recv(data)){
        ELOG("recv error");
        return false;
    }

    if(debug){
        LOG("recv");
        LOG(ZLog::RAW << data.dumpBytes(4, 8));
    }

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
