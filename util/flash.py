#!python3

import sys, os, time
import shutil
import pylink

#libraries = list(pylink.Library.find_library_linux())
#for lib in libraries:
#    print("  " + lib)

xml = os.path.join(os.path.dirname(__file__), "jlink_flashloader/JLinkDevices.xml")
devdir = os.path.join(os.path.dirname(__file__), "jlink_flashloader/Holtek")
shutil.copyfile(xml, "/tmp/JLinkDevices.xml")
try:
    os.mkdir("/tmp/Devices")
except:
    pass
try:
    shutil.copytree(devdir, "/tmp/Devices/Holtek")
except:
    pass

jlink = pylink.JLink()
#jlink = pylink.JLink(log=open("log.txt", "w"))

print("Library: " + jlink._library._path)
#print("Library: " + jlink._library._temp.name)

# devname = "HT32F1655"
devname = "HT32F52352"

print("Devices: " + str(jlink.num_supported_devices()))
for i in range(jlink.num_supported_devices()):
    device = jlink.supported_device(i)
    # print(device.name)
    if device.name.startswith(devname):
        print("Found: " + device.name)

print("Open JLink")
jlink.open()

#print("WORKAROUND: wait for background SEGGER task to timeout")
#time.sleep(8)

print("JLink: " + jlink.product_name)
print("Hardware: " + jlink.hardware_version)
print("Firmware: " + jlink.firmware_version)

#check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFC
check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF
check = check & 0xFFFFFFFF
print("Checksum: %X" % check)

jlink.set_tif(pylink.enums.JLinkInterfaces.SWD)
jlink.connect(devname, 4000, verbose=True)

print(jlink.register_list())

btable = jlink.memory_read(0x0, 32)
print("%s" % " ".join([ "%02X" % x for x in btable ]))
