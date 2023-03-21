#!/bin/bash

set -e

export OPTIMIZE="-Os"
export LDFLAGS="${OPTIMIZE}"
export CFLAGS="${OPTIMIZE}"
export CPPFLAGS="${OPTIMIZE}"

eval $@

echo "======================================="
echo "Compiling wasm bindings"
echo "======================================="
(
    # Compile C/C++ code
    emcc \
        ${OPTIMIZE} \
        --bind \
        --no-entry \
        -s STRICT=1 \
        -s ALLOW_MEMORY_GROWTH=1 \
        -s MALLOC=emmalloc \
        -s MODULARIZE=1 \
        -s EXPORT_ES6=1 \
        -o ./wasm-module.js \
        wasm-module.cpp
    
    # Create output directory
    mkdir -p dist

    # Move artifacts
    mv wasm-module.{js,wasm} dist
)
echo "======================================="
echo "Compiling wasm bindings done"
echo "======================================="
