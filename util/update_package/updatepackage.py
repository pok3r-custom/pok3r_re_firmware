
import sys
import os
import argparse
import struct


pok3r_xor_key = [
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
]

cykb_xor_key = [
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
]


def xor_decode_encode(data, xor_key):
    """
    Decode the encryption scheme used by the POK3R RGB firmware.
    Just XOR encryption with fixed 52-byte key.
    """

    odata = bytearray()
    for i in range(0, len(data), 4):
        key = xor_key[(i // 4) % 13]
        w1, = struct.unpack("<I", data[i:i+4])
        w2 = (w1 ^ key) & 0xFFFFFFFF
        odata += struct.pack("<I", w2)

    return odata


def decode_package_data(indata):
    """
    Decode the encryption scheme used by the updater program.
    Produced from IDA disassembly in sub_401000 of POK3R v117 updater.
    """

    data = bytearray(indata)
    # Swap bytes 4 apart, skip 5
    for i in range(4, len(data), 5):
        a = data[i-4]
        b = data[i]
        data[i-4] = b
        data[i] = a

    # Swap bytes in each set of two bytes
    for i in range(1, len(data), 2):
        d = data[i-1]
        b = data[i]
        data[i-1] = b
        data[i] = d

    # y = ((x - 7) << 4) + (x >> 4)
    for i in range(len(data)):
        data[i] = (((data[i] - 7) << 4) + (data[i] >> 4)) & 0xFF

    return data

def decode_pok3r_firmware(data):
    swap_key = [
        0,1,2,3,
        1,2,3,0,
        2,1,3,0,
        3,2,1,0,
        3,1,0,2,
        1,2,0,3,
        2,3,1,0,
        0,2,1,3,
    ]

    def decode_packet(dat, num):
        dat[:] = xor_decode_encode(dat, pok3r_xor_key)

        f = (num & 7) << 2
        for i in range(0, 52, 4):
            a = dat[i + swap_key[f + 0]]
            b = dat[i + swap_key[f + 1]]
            c = dat[i + swap_key[f + 2]]
            d = dat[i + swap_key[f + 3]]
            dat[i + 0] = a
            dat[i + 1] = b
            dat[i + 2] = c
            dat[i + 3] = d

    odata = bytearray()
    count = 0
    for i in range(0, len(data), 52):
        dat = data[i:i+52]
        if 10 <= count <= 100:
            decode_packet(dat, count)
        odata += dat
        count += 1

    return odata


class UpdateFirmware:
    def __init__(self, name, info, fw):
        self.name = name
        self.desc = ""
        self.version = ""
        self.info = info
        self.firmware = fw

    def show_info(self):
        if not len(self.info):
            return

        verlen, = struct.unpack("<I", self.info[:4])
        a, b, c, d, e, f, vid, pid = struct.unpack("<IIIIIIHH", self.info[120:120+28])
        h, = struct.unpack("<I", self.info[176:176+4])

        if verlen == 0xFFFFFFFF:
            verstr = "CLEARED"
        else:
            verstr = self.info[4:min(verlen, 60)].decode("utf-16").partition("\x00")[0]
        print("Version String: %s" % verstr)

        print("a: %08x" % a)
        print("Version: %08x" % b)
        print("c: %08x" % c)
        print("d: %08x" % d)
        print("e: %08x" % e)
        print("f: %08x" % f)
        print("VID/PID: %04x:%04x" % (vid, pid))
        print("h: %08x" % h)

    def print_info(self):
        print("Description: %s" % self.desc)
        print("Version: %s" % self.version)
        print("Layout: %s" % self.name)
        print("  Firmware - %d bytes" % len(self.firmware))
        print("  Info - %d bytes" % len(self.info))
        for i in range(0, len(self.info), 32):
            print("    %s" % "".join(["%02x" % x for x in self.info[i:i+32]]))
        self.show_info()


class UpdatePackage:
    def __init__(self, exe, name=""):
        self.exe = exe
        info = os.stat(self.exe)
        self.exelen = info.st_size
        self.firmware = []

        self.name = name
        self.pkgdesc = ""
        self.company = ""
        self.product = ""
        self.pkgver = ""
        self.sig = ""

    def decode_maajonsn(self):
        self.firmware = []

        strings_len = 0x4b8
        strings_start = self.exelen - strings_len
        offset_company = 0x10
        offset_product = offset_company + 0x208
        offset_sec_len = 0x420
        offset_layout = 0x424
        offset_version = 0x460
        offset_sig = 0x4ae

        with open(self.exe, "rb") as f:
            f.seek(strings_start)
            strs = f.read(strings_len)
            strs = decode_package_data(strs)

            self.company = strs[offset_company:offset_company+0x200].decode("utf-16").partition("\x00")[0]
            self.product = strs[offset_product:offset_product+0x200].decode("utf-16").partition("\x00")[0]
            self.pkgver = strs[offset_version:offset_version+12].decode("ascii").partition("\x00")[0]
            self.sig = strs[offset_sig:strings_len].decode("ascii").partition("\x00")[0]

            sec_len, = struct.unpack("<I", strs[offset_sec_len:offset_sec_len+4])
            layout = strs[offset_layout:offset_layout+0x20].decode("utf-16").partition("\x00")[0]

            total = strings_len + sec_len
            sec_start = self.exelen - total

            f.seek(sec_start)
            fsec = f.read(sec_len)
            fsec = decode_package_data(fsec)
            fsec = decode_pok3r_firmware(fsec)

            fw = UpdateFirmware(layout, bytes(), fsec)
            fw.version = self.pkgver
            self.firmware.append(fw)

    def decode_maav102(self):
        self.firmware = []

        strings_len = 0xb24
        strings_start = self.exelen - strings_len
        offset_desc = 0x26
        offset_company = offset_desc + 0x208
        offset_product = offset_company + 0x208
        offset_version = offset_product + 0x208
        offset_sig = 0xb19

        with open(self.exe, "rb") as f:
            f.seek(strings_start)
            strs = f.read(strings_len)
            strs = decode_package_data(strs)

            self.pkgdesc = strs[offset_desc:offset_desc + 0x200].decode("utf-16").partition("\x00")[0]
            self.company = strs[offset_company:offset_company+0x200].decode("utf-16").partition("\x00")[0]
            self.product = strs[offset_product:offset_product+0x200].decode("utf-16").partition("\x00")[0]
            self.pkgver = strs[offset_version:offset_version + 0x200].decode("utf-16").partition("\x00")[0]
            self.sig = strs[offset_sig:strings_len].decode("ascii").partition("\x00")[0]

            total = strings_len
            start = 0xac8 - (0x50 * 8)
            for i in range(start, 0xac8, 0x50):
                fwl, strl = struct.unpack("<II", strs[i:i+8])
                total += (fwl + strl)

            sec_start = self.exelen - total
            for i in range(8):
                fwl, strl = struct.unpack("<II", strs[start:start+8])
                if not fwl or not strl:
                    break

                layout = strs[start+8:start+8+0x20].decode("utf-16").partition("\x00")[0]

                f.seek(sec_start)
                sec_start += fwl
                fsec = f.read(fwl)
                fsec = decode_package_data(fsec)
                fsec = xor_decode_encode(fsec, cykb_xor_key)

                f.seek(sec_start)
                sec_start += strl
                ssec = f.read(strl)
                ssec = decode_package_data(ssec)

                fw = UpdateFirmware(layout, ssec, fsec)
                fw.version = self.pkgver
                self.firmware.append(fw)

                start += 0x50

    def decode_maav105(self):
        self.firmware = []

        strings_len = 0x2b58
        strings_start = self.exelen - strings_len
        offset_pkgdesc = 0x232a
        offset_company = offset_pkgdesc + 0x208
        offset_product = offset_company + 0x208
        offset_pkgver = offset_product + 0x208
        offset_sig = self.exelen - strings_start - 13

        with open(self.exe, "rb") as f:
            f.seek(strings_start)
            strs = f.read(strings_len)
            strs = decode_package_data(strs)

            self.pkgdesc = strs[offset_pkgdesc:offset_pkgdesc+0x200].decode("utf-16").partition("\x00")[0]
            self.company = strs[offset_company:offset_company+0x200].decode("utf-16").partition("\x00")[0]
            self.product = strs[offset_product:offset_product+0x200].decode("utf-16").partition("\x00")[0]
            self.pkgver = strs[offset_pkgver:offset_pkgver+0x200].decode("utf-16").partition("\x00")[0]
            self.sig = strs[offset_sig:offset_sig+13].decode("ascii").partition("\x00")[0]

            list_pos = 0xc8
            sec_start = 0x1F1600
            for i in range(4):
                desc_start = list_pos
                version_start = desc_start + 0x208
                addr_pos = version_start + 0x208
                layout_start = addr_pos + 8

                desc = strs[desc_start:desc_start+0x200].decode("utf-16").partition("\x00")[0]
                version = strs[version_start:version_start+0x200].decode("utf-16").partition("\x00")[0]

                list_pos = layout_start + 0x2c8

                while int(strs[layout_start]):
                    layout = strs[layout_start:layout_start+60].decode("utf-16").partition("\x00")[0]
                    a1, a2, a3 = struct.unpack("<HHH", strs[layout_start+60:layout_start+60+6])
                    print("Layout: %s %04x %04x %04x" % (layout, a1, a2, a3))
                    layout_start += 80

                fwl, strl = struct.unpack("<II", strs[addr_pos:addr_pos+8])

                if fwl:
                    f.seek(sec_start)
                    sec_start += fwl
                    fsec = f.read(fwl)
                    fsec = decode_package_data(fsec)
                    fsec = xor_decode_encode(fsec, cykb_xor_key)

                    f.seek(sec_start)
                    sec_start += strl
                    ssec = f.read(strl)
                    ssec = decode_package_data(ssec)

                    fw = UpdateFirmware(layout, ssec, fsec)
                    fw.desc = desc
                    fw.version = version
                    self.firmware.append(fw)

    def print_info(self):
        print("Description: %s" % self.pkgdesc)
        print("Company: %s" % self.company)
        print("Product: %s" % self.product)
        print("Version: %s" % self.pkgver)
        print("Signature: %s" % self.sig)
        self.print_section_info()

    def print_section_info(self):
        for f in self.firmware:
            f.print_info()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("exe")
    args = parser.parse_args()

    package = UpdatePackage(args.exe)

    package.decode_maajonsn()
    # package.decode_maav102()
    # package.decode_maav105()
    package.print_info()

    for i, f in enumerate(package.firmware):
        ofile = os.path.join(os.path.dirname(args.exe), "fw_%d.bin" % i)
        with open(ofile, "wb") as w:
            w.write(f.firmware)
        print("Firmware %d Written to %s" % (i, ofile))


