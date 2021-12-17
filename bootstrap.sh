#!/bin/bash
DEPS=(cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib build-essential)
if apt-get install -y --dry-run "${DEPS[@]}" | grep 'Inst' > /dev/null; then
    sudo apt-get install -y "${DEPS[@]}"
fi

git submodule update --init
cd pico-sdk
git submodule update --init
cd ..

mkdir -p build
