#!python3

import sys
import os
import time
import shutil
import tempfile
import pylink

copy_xml = True

xmlpath = os.path.abspath("jlink_flashloader/JLinkDevices.xml")
devspath = os.path.abspath("jlink_flashloader/Devices")
tmpxmlpath = os.path.join(tempfile.gettempdir(), "JLinkDevices.xml")
tmpdevspath = os.path.join(tempfile.gettempdir(), "Devices")

try:
    if copy_xml:
        shutil.copy(xmlpath, tmpxmlpath)
        shutil.copytree(devspath, tmpdevspath)

    jlink = pylink.JLink()
    #jlink = pylink.JLink(log=open("log.txt", "w"))

    print("Library: " + jlink._library._lib._name)

    print("Devices: " + str(jlink.num_supported_devices()))
    for i in range(jlink.num_supported_devices()):
        device = jlink.supported_device(i)
        if device.name == "HT32F1654":
            print("Found: " + device.name)

    print("Connect JLink...")
    jlink.open()

    print("XML: %s" % xmlpath)
    jlink.exec_command("JLinkDevicesXMLPath = " + xmlpath)

    print("Devices: " + str(jlink.num_supported_devices()))

    #print("WORKAROUND: wait for background SEGGER task to timeout")
    #time.sleep(8)

    print("JLink: " + jlink.product_name)
    print("Hardware: " + jlink.hardware_version)
    print("Firmware: " + jlink.firmware_version)

    #check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFC
    check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF
    check = check & 0xFFFFFFFF
    # print("%X" % check)

    print("Connect Device...")

    jlink.set_tif(pylink.enums.JLinkInterfaces.SWD)
    try:
        jlink.connect("HT32F1654", 4000, verbose=True)
        # jlink.connect("HT32F1655", 4000, verbose=True)
        # jlink.connect("HT32F1755", 4000, verbose=True)
        # jlink.connect("HT32F52351", 4000, verbose=True)
        # jlink.connect("HT32F52352", 4000, verbose=True)
    except pylink.errors.JLinkException as e:
        print(e)
        pass

    #print(jlink.register_list())

    if len(sys.argv) > 2:
        addr = int(sys.argv[1], 0)
        fw = sys.argv[2]
        print("Flash %04x %s" % (addr, fw))

        jlink.flash_file(fw, addr)

    else:
        addr = 0x0
        len = 32
        print("Read %04x %d" % (addr, len))
        print("".join(["%02X" % x for x in jlink.memory_read(addr, len)]))

    print("Done")

finally:
    if copy_xml:
        os.remove(tmpxmlpath)
        shutil.rmtree(tmpdevspath)
