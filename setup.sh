#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Install the necessary packages.

if [[ "$OSTYPE" == "msys" ]]; then
  pacman -Syu --noconfirm
  pacman -Syu --noconfirm autoconf automake git libtool make mingw-w64-x86_64-cmake mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb mingw-w64-x86_64-jq mingw-w64-x86_64-pkgconf python tar unzip wget zip zstd
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [ -f "/etc/arch-release" ]; then
    pacman -S --noconfirm cmake curl gcc gdb git jq libpulse make pkgconf python tar unzip wget zip zstd
  else
    apt-get install -y cmake curl gdb git jq libasound2-dev libglu1-mesa-dev libgtk2.0-dev libgtk-3-dev libjack-jackd2-dev libpulse-dev libx11-dev libxcursor-dev libxi-dev libxinerama-dev libxrandr-dev pkg-config unzip zlib1g-dev zstd
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install autoconf automake cmake git jq libtool pkg-config python wget zstd
fi

# Install the SDK.

if [ ! -d "$PWD/sdk" ]; then
  SDK_URL="https://vcvrack.com/downloads/Rack-SDK-2.3.0-"
  
  if [[ "$OSTYPE" == "msys" ]]; then
    SDK_URL+="win-x64.zip"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SDK_URL+="lin-x64.zip"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ $(UNAME -m) == "arm64" ]]; then
      SDK_URL+="mac-arm64.zip"
    else
      SDK_URL+="mac-x64.zip"
    fi
  fi

  wget -O sdk.zip $SDK_URL
  unzip sdk.zip
  rm sdk.zip
  mv Rack-SDK sdk
fi

# Initialize the plugin and the module.

py sdk/helper.py createplugin plugin plugin
cp -r "$SCRIPT_DIR/.template/." ./plugin
cd plugin
py ../sdk/helper.py createmodule module1 ./res/module1.svg ./src/module1.cpp
cd ..

# Apply the patch.

patch -p1 < "$SCRIPT_DIR/.patch/patch.diff"

# Build.

cd plugin
/bin/bash build.sh
cd ..