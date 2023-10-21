#!/bin/bash

# Check for flags
if [[ $# -gt 0 ]]; then
    case $1 in
        --test)
            mode="test"
            ;;
        --app)
            mode="app"
            ;;
        *)
            echo "Unknown flag: $1"
            exit 1
            ;;
    esac
fi

mkdir -p build
cd build

cmake -DOPENSSL_ROOT_DIR=/opt/homebrew/Cellar/openssl@3/3.1.3 -DOPENSSL_LIBRARIES=/opt/homebrew/Cellar/openssl@3/3.1.3/lib ..
make

if [[ $mode == "test" ]]; then
    ./testSuite
elif [[ $mode == "app" ]]; then
    ./fileEncryptor
fi