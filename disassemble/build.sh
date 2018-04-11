#!/bin/bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR

pushd pok3r
pushd builtin
$DIR/reas.sh firmware_builtin.s $DIR/vma0.ld
popd
pushd v117
$DIR/reas.sh pok3r_v117.s $DIR/vma2c.ld
popd
popd

pushd pok3r_rgb
pushd builtin_rgb
$DIR/reas.sh firmware_builtin_rgb.s $DIR/vma0.ld
popd
pushd v140
$DIR/reas.sh pok3r_rgb_v140.s $DIR/vma34.ld
popd
popd

pushd pok3r_rgb2/v105
$DIR/reas.sh rgb2_v105.s $DIR/vma34.ld
popd

pushd vortex_core
pushd builtin_core
$DIR/reas.sh vortex_core_builtin.s $DIR/vma0.ld
popd
pushd v145
$DIR/reas.sh core_v145.s $DIR/vma34.ld
popd
popd

pushd race3
pushd bootloader
$DIR/reas.sh race3_bootloader.s $DIR/vma0.ld
popd
pushd v124
$DIR/reas.sh race_v124.s $DIR/vma34.ld
popd
popd

popd

