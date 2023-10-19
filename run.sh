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

cmake ..
make

if [[ $mode == "test" ]]; then
    ./testSuite
elif [[ $mode == "app" ]]; then
    ./fileEncryptor
fi