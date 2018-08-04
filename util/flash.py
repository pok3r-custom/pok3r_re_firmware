#!python3

import sys, os, time
import pylink

#libraries = list(pylink.Library.find_library_linux())
#for lib in libraries:
#    print("  " + lib)

jlink = pylink.JLink()
#jlink = pylink.JLink(log=open("log.txt", "w"))

print("Library: " + jlink._library._path)
#print("Library: " + jlink._library._temp.name)

print("Devices: " + str(jlink.num_supported_devices()))
for i in range(jlink.num_supported_devices()):
    device = jlink.supported_device(i)
    if device.name == "HT32F1655":
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
print("%X" % check)

jlink.set_tif(pylink.enums.JLinkInterfaces.SWD)
jlink.connect("HT32F1655", 4000, verbose=True)

print(jlink.register_list())
