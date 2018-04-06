
jlink:
	JLinkExe -Device HT32F1654 -CommanderScript util/connect.jlink
	#JLinkExe -Device HT32F1655 -CommanderScript util/connect.jlink

pok3r_bootloader:
	cp disassemble/pok3r/builtin/firmware_builtin.bin .tmp.bin
	JLinkExe -Device HT32F1655 -CommanderScript util/flash.jlink
	rm .tmp.bin

core_bootloader:
	cp disassemble/vortex_core/builtin_core/firmware_builtin_core.bin .tmp.bin
	JLinkExe -Device HT32F1654 -CommanderScript util/flash.jlink
	rm .tmp.bin

