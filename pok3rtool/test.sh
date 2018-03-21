#!/bin/sh

mkdir -p output

./pok3rtool decode $1/vendor/vortex/POK3R_V117.exe      output/pok3r_v1117.bin
./pok3rtool decode $1/vendor/vortex/POK3R_RGB_V140.exe  output/pok3r_rgb_v140.bin
./pok3rtool decode $1/vendor/vortex/CORE_V145.exe       output/core_v145.bin
./pok3rtool decode $1/vendor/vortex/RACE_V124.exe       output/race_v124.bin

./pok3rtool decode $1/vendor/kbp/cykb112_v107.exe       output/kvp60_v107.bin
./pok3rtool decode $1/vendor/kbp/cykb129_v106.exe       output/kvp80_v129.bin

./pok3rtool decode $1/vendor/tex/AP_0163_1.01.01r.exe   output/yoda_v101.bin

