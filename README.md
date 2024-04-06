# trying-out-wasi
trying out the potential of wasip1

# My environment
- arch:         amd64
- OS:           manjaro
- C compiler:   clang version 16.0.6
- go compiler:  tinygo version 0.31.1 linux/amd64 (using go version go1.22.0 and LLVM version 17.0.1)
- wasm runtime: wasmtime-cli 18.0.2 (90db6e99f 2024-02-28)
- wit-bindgen:  wit-bindgen-cli 0.24.0

# what you will need besides stuffs above
- wasi-compiler-rt
- wasi-libc

# TODO
- complex types
    - protobuf                      - some languages need native library for protobuf to work
    - WIT (wasm interface types)    - limited support for wasm preview 1
- memory management
