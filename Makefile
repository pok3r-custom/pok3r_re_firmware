
jlink:
	JLinkExe -Device HT32F1654 -CommanderScript util/connect.jlink
	#JLinkExe -Device HT32F1655 -CommanderScript util/connect.jlink

erase_pok3r:
	JLinkExe -Device HT32F1655 -CommanderScript util/version-erase1655.jlink

erase_cykb:
	JLinkExe -Device HT32F1654 -CommanderScript util/version-erase1654.jlink

pok3r_bootloader:
	cp disassemble/pok3r/builtin/firmware_builtin.bin .tmp.bin
	JLinkExe -Device HT32F1655 -CommanderScript util/flash.jlink
	rm .tmp.bin

core_bootloader:
	cp disassemble/vortex_core/builtin_core/firmware_builtin_core.bin .tmp.bin
	JLinkExe -Device HT32F1654 -CommanderScript util/flash.jlink
	rm .tmp.bin

mass_erase:
	JLinkExe -Device HT32F1654 -CommanderScript util/mass-erase.jlink

