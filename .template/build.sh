#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

cd "$SCRIPT_DIR"
export RACK_DIR="$SCRIPT_DIR/../sdk"
make dep
make install BUILD_TYPE=$1
cd "$OLDPWD"