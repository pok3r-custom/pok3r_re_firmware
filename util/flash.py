#!python3

import sys
import os
import time
import shutil
import tempfile
import argparse
import logging
import ctypes

import pylink

parser = argparse.ArgumentParser()
parser.add_argument("--device", default="HT32F1654")
parser.add_argument("addr", nargs="?", type=lambda v: int(v, 0), default=0)
parser.add_argument("file", nargs="?")
parser.add_argument("--verbose", "-v", action="count", default=0)
args = parser.parse_args()

level = logging.INFO
if args.verbose > 0:
    level = logging.DEBUG

logging.basicConfig(level=level, stream=sys.stdout, format="%(name)-15s %(levelname)-5s - %(message)s")
log = logging.getLogger(__name__)

jlink_log = logging.getLogger("jlink")
detail_buffer = bytearray()

device_name = args.device

copy_xml = False

xmlpath = os.path.abspath("jlink_flashloader/JLinkDevices.xml")
devspath = os.path.abspath("jlink_flashloader/Holtek")
tmpxmlpath = os.path.join(tempfile.gettempdir(), "JLinkDevices.xml")
tmpdevspath = os.path.join(tempfile.gettempdir(), "Devices")

try:
    if copy_xml:
        shutil.copy(xmlpath, tmpxmlpath)
        shutil.copytree(devspath, tmpdevspath)

    # jlink = pylink.JLink()
    lib = pylink.Library()
    lib.unload()
    lib._lib = ctypes.cdll.LoadLibrary("/opt/SEGGER/JLink/libjlinkarm.so")
    jlink = pylink.JLink(lib)

    def log_handler(text : bytes):
        jlink_log.info(text.decode("ascii"))
    jlink.log_handler = log_handler

    def detail_log_handler(text : bytes):
        global detail_buffer
        detail_buffer += text
        # log.debug(text)
        b, d, a = detail_buffer.partition(b"\n")
        while d:
            jlink_log.debug(b.strip(b"\r").decode("ascii"))
            detail_buffer = a
            b, d, a = detail_buffer.partition(b"\n")
    jlink.detailed_log_handler = detail_log_handler

    log.info("Library: " + jlink._library._lib._name)

    log.info("Devices: " + str(jlink.num_supported_devices()))
    for i in range(jlink.num_supported_devices()):
        device = jlink.supported_device(i)
        if device.name == device_name:
            log.info("Found: " + device.name)

    log.info("Connect JLink...")
    jlink.open()

    # print("XML: %s" % xmlpath)
    # cmd = "JLinkDevicesXMLPath " + xmlpath
    # print(cmd)
    # jlink.exec_command(cmd)

    log.info("Devices: " + str(jlink.num_supported_devices()))

    #print("WORKAROUND: wait for background SEGGER task to timeout")
    #time.sleep(8)

    log.info("JLink: " + jlink.product_name)
    log.info("Hardware: " + jlink.hardware_version)
    log.info("Firmware: " + jlink.firmware_version)

    #check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFC
    check = 0xFFFFFFE0 + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF + 0xFFFFFFFF
    check = check & 0xFFFFFFFF
    # print("%X" % check)

    log.info("Connect Device...")

    jlink.set_tif(pylink.enums.JLinkInterfaces.SWD)
    jlink.connect(device_name, 4000, verbose=True)

    if args.file:
        jlink.halt()

        log.info("Erase")
        jlink.erase()

        log.info("Flash %04x %s" % (args.addr, args.file))
        jlink.flash_file(args.file, args.addr)

    else:
        size = 32
        log.info("Read %04x %d" % (args.addr, size))
        data = bytes(jlink.memory_read(args.addr, size))
        log.info(data.hex())

except pylink.errors.JLinkException as e:
    log.exception(e)

finally:
    if copy_xml:
        os.remove(tmpxmlpath)
        shutil.rmtree(tmpdevspath)
