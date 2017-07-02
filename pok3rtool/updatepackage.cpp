#include "updatepackage.h"
#include "proto_pok3r.h"
#include "proto_cykb.h"

#include "zfile.h"
#include "zhash.h"
#include "zmap.h"
#include "zlog.h"

typedef int (*decodeFunc)(ZFile *, ZBinary &);
int decode_maajonsn(ZFile *file, ZBinary &fw_out);
int decode_maav102(ZFile *file, ZBinary &fw_out);
int decode_kbp_cykb(ZFile *file, ZBinary &fw_out);

enum PackType {
    PACKAGE_NONE = 0,
    MAAJONSN,   // .maajonsn
    MAAV102,    // .maaV102
    KBPCYKB,
};

const ZMap<zu64, PackType> packages = {
    // POK3R (141)
    { 0x62FCF913A689C9AE,   MAAJONSN }, // V1.1.3
    { 0xFE37430DB1FFCF5F,   MAAJONSN }, // V1.1.4
    { 0x8986F7893143E9F7,   MAAJONSN }, // V1.1.5
    { 0xA28E5EFB3F796181,   MAAJONSN }, // V1.1.6
    { 0xEA55CB190C35505F,   MAAJONSN }, // V1.1.7

    // POK3R RGB (167)
    { 0x882CB0E4ECE25454,   MAAV102 },  // V1.02.04   v1.2.4
    { 0x6CFF0BB4F4086C2F,   MAAV102 },  // V1.03.00   v1.3.0
    { 0xA6EE37F856CD24C1,   MAAV102 },  // V1.04.00   v1.4.0

    // CORE (175)
    { 0x51BFA86A7FAF4EEA,   MAAV102 },  // V1.04.01   v1.4.1
    { 0x0582733413943655,   MAAV102 },  // V1.04.03   v1.4.3

    // NEW 75? (192)
    { 0xb542d0d86b9a85c3,   MAAV102 },  // V1.02.01   v1.2.1

    // (207)
    { 0x8AA1AEA217DA685B,   MAAV102 },  // V1.00.05   v1.0.5

    // KBP V60 (112)
    { 0x6064D8C4EE74BE18,   KBPCYKB },  //

    // KBP V80 (129)
    { 0xBCF4C9830D800D8C,   KBPCYKB },  //
};

const ZMap<PackType, decodeFunc> types = {
    { MAAJONSN, decode_maajonsn },
    { MAAV102,  decode_maav102 },
    { KBPCYKB,  decode_kbp_cykb },
};

UpdatePackage::UpdatePackage(){

}

bool UpdatePackage::loadFromExe(ZPath exe, int index){
    LOG("Extract from " << exe);
    ZFile file;
    if(!file.open(exe, ZFile::READ)){
        ELOG("Failed to open file");
        return false;
    }

    zu64 exehash = ZFile::fileHash(exe);
    if(packages.contains(exehash)){
        int ret = types[packages[exehash]](&file, firmware);
        return !!ret;
    } else {
        ELOG("Unknown updater executable: " << ZString::ItoS(exehash, 16));
        return false;
    }

    return true;
}

const ZBinary &UpdatePackage::getFirmware() const {
    return firmware;
}

/*  Decode the encryption scheme used by the updater program.
 *  Produced from IDA disassembly in sub_401000 of v117 updater.
 *  First, swap the 1st and 4th bytes, every 5 bytes
 *  Second, reverse each pair of bytes
 *  Third, shift the bits in each byte, sub 7 from MSBs
 */
void decode_package_data(ZBinary &bin){
    // Swap bytes 4 apart, skip 5
    for(zu64 i = 4; i < bin.size(); i+=5){
        zbyte a = bin[i-4];
        zbyte b = bin[i];
        bin[i-4] = b;
        bin[i] = a;
    }

    // Swap bytes in each set of two bytes
    for(zu64 i = 1; i < bin.size(); i+=2){
        zbyte d = bin[i-1];
        zbyte b = bin[i];
        bin[i-1] = b;
        bin[i] = d;
    }

    // y = ((x - 7) << 4) + (x >> 4)
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = ((bin[i] - 7) << 4) + (bin[i] >> 4);
    }
}

/*  Encrypt using the encryption scheme used by the updater program
 *   Reverse engineered from the above
 */
void encode_package_data(ZBinary &bin){
    // x = (y >> 4 + 7 & 0xF) | (x << 4)
    for(zu64 i = 0; i < bin.size(); ++i){
        bin[i] = (((bin[i] >> 4) + 7) & 0xF) | (bin[i] << 4);
    }

    // Swap bytes in each set of two bytes
    for(zu64 i = 1; i < bin.size(); i+=2){
        zbyte d = bin[i-1];
        zbyte b = bin[i];
        bin[i-1] = b;
        bin[i] = d;
    }

    // Swap bytes 4 apart, skip 5
    for(zu64 i = 4; i < bin.size(); i+=5){
        zbyte a = bin[i-4];
        zbyte b = bin[i];
        bin[i-4] = b;
        bin[i] = a;
    }
}

/*  Decode the updater for the POK3R.
 */
int decode_maajonsn(ZFile *file, ZBinary &fw_out){
    zu64 exelen = file->fileSize();

    zu64 strings_len = 0x4B8;

    zu64 offset_company = 0x10;
    zu64 offset_product = offset_company + 0x208; // 0x218
    zu64 offset_version = 0x460;
    zu64 offset_sig = 0x4AE;

    zu64 strings_start = exelen - strings_len;

    // Read strings
    ZBinary strs;
    if(file->seek(strings_start) != strings_start){
        LOG("File too short - seek");
        return -4;
    }
    if(file->read(strs, strings_len) != strings_len){
        LOG("File too short - read");
        return -5;
    }
    // Decrypt strings
    decode_package_data(strs);

    ZString company;
    ZString product;
    ZString version;

    // Company name
    company.parseUTF16((const zu16 *)(strs.raw() + offset_company), 0x200);
    // Product name
    product.parseUTF16((const zu16 *)(strs.raw() + offset_product), 0x200);
    // Version
    version = ZString(strs.raw() + offset_version, 12);

    LOG("Company:     " << company);
    LOG("Product:     " << product);
    LOG("Version:     " << version);

    LOG("Signature:   " << ZString(strs.raw() + offset_sig, strings_len - offset_sig));

//    LOG("String Dump:");
//    RLOG(strs.dumpBytes(4, 8));

    // Decode other encrypted sections

    zu64 total = strings_len;
    ZArray<zu64> sections;

    zu64 sec_len = ZBinary::decle32(strs.raw() + 0x420); // Firmware length

    ZString layout;
    layout.parseUTF16((const zu16 *)(strs.raw() + 0x424), 0x20);
    LOG("Layout: " << layout);

    total += sec_len;
    sections.push(sec_len);

    zu64 sec_start = exelen - total;

    LOG("Offset: 0x" << ZString::ItoS(sec_start, 16));
    LOG("Length: 0x" << ZString::ItoS(sec_len, 16));

    // Read section
    ZBinary sec;
    if(file->seek(sec_start) != sec_start){
        LOG("File too short - seek");
        return -2;
    }
    if(file->read(sec, sec_len) != sec_len){
        LOG("File too short - read");
        return -3;
    }

    // Decode section
    decode_package_data(sec);

    // Decrypt firmware
    ProtoPOK3R::decode_firmware(sec);

//    LOG("Section Dump:");
//    RLOG(sec.dumpBytes(4, 8, 0));

    // Write firmware
    fw_out = sec;

    return 0;

}

/*  Decode the updater for the POK3R RGB / Vortex Core.
 */
int decode_maav102(ZFile *file, ZBinary &fw_out){
    zu64 exelen = file->fileSize();

    zu64 strings_len = 0xB24;   // from IDA disassembly in sub_403830 of v130 updater
                                // same size in v104
    zu64 strings_start = exelen - strings_len;

    zu64 offset_desc = 0x26;
    zu64 offset_company = offset_desc + 0x208;      // 0x22e
    zu64 offset_product = offset_company + 0x208;   // 0x436
    zu64 offset_version = offset_product + 0x208;   // 0x63e
    zu64 offset_sig = 0xb19;

    // Read strings
    ZBinary strs;
    if(file->seek(strings_start) != strings_start){
        LOG("File too short - seek");
        return -4;
    }
    if(file->read(strs, strings_len) != strings_len){
        LOG("File too short - read");
        return -5;
    }
    // Decrypt strings
    decode_package_data(strs);

    ZString desc;
    ZString company;
    ZString product;
    ZString version;

    // Description
    desc.parseUTF16((const zu16 *)(strs.raw() + offset_desc), 0x200);
    // Company name
    company.parseUTF16((const zu16 *)(strs.raw() + offset_company), 0x200);
    // Product name
    product.parseUTF16((const zu16 *)(strs.raw() + offset_product), 0x200);
    // Version
    version.parseUTF16((const zu16 *)(strs.raw() + offset_version), 0x200);

    LOG("Description: " << desc);
    LOG("Company:     " << company);
    LOG("Product:     " << product);
    LOG("Version:     " << version);

    LOG("Signature:   " << ZString(strs.raw() + offset_sig, strings_len - offset_sig));

//    LOG("String Dump:");
//    RLOG(strs.dumpBytes(4, 8));

    // Decode other encrypted sections

    zu64 total = strings_len;
    ZArray<zu64> sections;

    zu64 start = 0xAC8 - (0x50 * 8);
    for(zu8 i = 0; i < 8; ++i){
        zu32 fwl = ZBinary::decle32(strs.raw() + start); // Firmware length
        zu32 strl = ZBinary::decle32(strs.raw() + start + 4); // Info length

        if(fwl){
            ZString layout;
            layout.parseUTF16((const zu16 *)(strs.raw() + start + 8), 0x20);
            LOG("Layout " << i << ": " << layout);

            total += fwl;
            total += strl;
            sections.push(fwl);
            sections.push(strl);
        }
        start += 0x50;
    }

    zu64 sec_start = exelen - total;
    LOG("Section Count: " << sections.size());

    for(zu64 i = 0; i < sections.size(); ++i){
        zu64 sec_len = sections[i];
        if(sec_len == 0)
            continue;

        LOG("Section " << i << ":");
        LOG("  Offset: 0x" << ZString::ItoS(sec_start, 16));
        LOG("  Length: 0x" << ZString::ItoS(sec_len, 16));

        // Read section
        ZBinary sec;
        if(file->seek(sec_start) != sec_start){
            LOG("File too short - seek");
            return -2;
        }
        if(file->read(sec, sec_len) != sec_len){
            LOG("File too short - read");
            return -3;
        }

        sec_start += sec_len;

        // Decode section
        decode_package_data(sec);

        // Decrypt RGB firmwares only
        if(sec.size() > 180){
            ProtoCYKB::decode_firmware(sec);
        }

//        LOG("Section Dump:");
//        RLOG(sec.dumpBytes(4, 8, 0));

//        ZPath secout = out;
//        secout.last() = out.getName() + "-" + i + out.getExtension();
//        LOG("  Output: " << secout);

        // Write firmware
//        ZFile fwout(secout, ZFile::WRITE);
//        fwout.write(sec);
        fw_out = sec;
    }

    return 0;
}

void kbp_decrypt(zbyte *data, zu64 size, zu32 key)
{
    zbyte xor_key[4];
    ZBinary::encbe32(xor_key, key);
    for(zu64 i = 0; i < size; ++i){
        data[i] = data[i] ^ xor_key[i % 4] ^ (i & 0xFF);
    }
}

/*  Decode the updater for the KBP V60 / V80.
 */
int decode_kbp_cykb(ZFile *file, ZBinary &fw_out){
//    zu32 key = 0xDA6282CD;  // v60
    zu32 key = 0xF6F3111F;  // v80

    zu64 exelen = file->fileSize();
    zu64 strings_len = 588;
    zu64 strings_start = exelen - strings_len;

    // Read strings
    ZBinary strs;
    if(file->seek(strings_start) != strings_start){
        LOG("File too short - seek");
        return -4;
    }
    if(file->read(strs, strings_len) != strings_len){
        LOG("File too short - read");
        return -5;
    }

    // Decrypt strings
    kbp_decrypt(strs.raw(), strs.size(), key);

    LOG("String Dump:");
    RLOG(strs.dumpBytes(4, 8));

    zu64 fw_start = 0x54000;
    zu64 fw_len = ZBinary::decle32(strs.raw() + 4);

    LOG("Firmware Size 0x" << ZString::ItoS(fw_len, 16));

    // Read firmware
    ZBinary fw;
    if(file->seek(fw_start) != fw_start){
        LOG("File too short - seek");
        return -2;
    }
    if(file->read(fw, fw_len) != fw_len){
        LOG("File too short - read");
        return -3;
    }

    // Decrypt firmware
    kbp_decrypt(fw.raw(), fw.size(), key);
    fw_out = fw;

    RLOG(fw_out.dumpBytes(4, 8));

    return 0;
}

int encode_image(ZPath fwin, ZPath fwout){
    LOG("Input: " << fwin);

    // Read firmware
    ZBinary fwbin;
    if(!ZFile::readBinary(fwin, fwbin)){
        LOG("Failed to read file");
        return -1;
    }

//    Pok3r::encode_firmware(fwbin);
    ProtoCYKB::encode_firmware(fwbin);
    encode_package_data(fwbin);

    LOG("Output: " << fwout);

    // Write encoded image
    if(!ZFile::writeBinary(fwout, fwbin)){
        ELOG("Failed to write file");
        return -2;
    }

    return 0;
}

int encode_patch_updater(ZPath exein, ZPath fwin, ZPath exeout){
    LOG("In Updater: " << exein);
    LOG("In Firmware: " << fwin);

    // Read updater
    ZBinary exebin;
    if(!ZFile::readBinary(exein, exebin)){
        ELOG("Failed to read file");
        return -1;
    }

    // Read firmware
    ZBinary fwbin;
    if(!ZFile::readBinary(fwin, fwbin)){
        LOG("Failed to read file");
        return -2;
    }

    // Encode firmware
//    Pok3r::encode_firmware(fwbin);
    ProtoCYKB::encode_firmware(fwbin);
    encode_package_data(fwbin);

    // Write encoded firmware onto exe
//    exebin.seek(0x1A3800);
    exebin.seek(0x2BE000);
    exebin.write(fwbin);

    ZFile exefile;
    if(!exefile.open(exeout, ZFile::WRITE)){
        ELOG("Failed to open file");
        return -3;
    }
    // Write updated exe
    if(!exefile.write(exebin)){
        LOG("Write error");
        return -4;
    }

    LOG("Out Updater: " << exeout);

    return 0;
}
