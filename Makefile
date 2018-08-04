
build:
	@echo "** Build Disassembled Firmware"
	@sh disassemble/build.sh

reassemble:
	@echo "** Reference Firmware Disassemble"
	@sh disassemble/reas.sh $(abspath ../reassemble-build/reassemble)

jlink_dir = /opt/SEGGER/JLink
jlink_lib_dir = /opt/SEGGER/JLink/JLink_Linux_V632g_x86_64
ozone_dir = /opt/SEGGER/Ozone/Lib
studio_dir = /opt/SEGGER/segger_embedded_studio_for_arm_3.34a/bin

install:
	#cp util/jlink_flashloader/JLinkDevices.xml $(jlink_dir)
	#cp -R util/jlink_flashloader/Holtek $(jlink_dir)/Devices
	#cp util/jlink_flashloader/JLinkDevices.xml $(jlink_lib_dir)
	#cp -R util/jlink_flashloader/Holtek $(jlink_lib_dir)/Devices
	#cp util/jlink_flashloader/JLinkDevices.xml $(ozone_dir)
	#cp -R util/jlink_flashloader/Holtek $(ozone_dir)/Devices
	#cp util/jlink_flashloader/JLinkDevices.xml $(studio_dir)
	#cp -R util/jlink_flashloader/Holtek $(studio_dir)/Devices
	cp util/jlink_flashloader/JLinkDevices.xml /tmp
	cp -R util/jlink_flashloader/Holtek /tmp/Devices

jlink:
	#JLinkExe -Device HT32F1654 -CommanderScript util/connect.jlink
	JLinkExe -Device HT32F1655 -CommanderScript util/connect.jlink

erase_pok3r:
	JLinkExe -Device HT32F1655 -CommanderScript util/version-erase1655.jlink

erase_cykb:
	JLinkExe -Device HT32F1654 -CommanderScript util/version-erase1654.jlink

protect_pok3r:
	JLinkExe -Device HT32F1654 -CommanderScript util/protect1655.jlink

protect_cykb:
	JLinkExe -Device HT32F1654 -CommanderScript util/protect1654.jlink

pok3r_bootloader:
	cp disassemble/pok3r/builtin/firmware_builtin.bin /tmp/flash.bin
	JLinkExe -Device HT32F1655 -CommanderScript util/flash.jlink
	rm /tmp/flash.bin

rgb_bootloader:
	cp disassemble/pok3r_rgb/builtin_rgb/firmware_builtin_rgb.bin /tmp/flash.bin
	JLinkExe -Device HT32F1654 -CommanderScript util/flash.jlink
	rm /tmp/flash.bin

core_bootloader:
	cp disassemble/core/builtin_core/firmware_builtin_core.bin /tmp/flash.bin
	JLinkExe -Device HT32F1654 -CommanderScript util/flash.jlink
	rm /tmp/flash.bin

mass_erase:
	JLinkExe -Device HT32F1654 -CommanderScript util/mass-erase.jlink

unprotect:
	JLinkExe -Device HT32F1654 -CommanderScript util/unprotect.jlink

