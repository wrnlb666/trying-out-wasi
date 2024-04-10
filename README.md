# trying-out-wasi
trying out the potential of wasip1

# My environment
- arch:         amd64
- OS:           manjaro
- C compiler:   clang version 16.0.6
- go compiler:  tinygo version 0.31.1 linux/amd64 (using go version go1.22.0 and LLVM version 17.0.1)
- wasm runtime: wasmtime-cli 18.0.2 (90db6e99f 2024-02-28)

# what you will need besides stuffs above
- wasi-compiler-rt  - for clang to work
- wasi-libc         - libc for wasi
- wasm-tools        - for wasi components
- wit-bindgen       - for create wit bindings for different languages (like protoc)

# TODO
## dream
- complex types
    - protobuf                      - some languages need native library for protobuf to work
    - WIT (wasm interface types)    - limited support for wasm preview 1
- memory management
## reality
- Tools around wasi components are not finished, making it almost impossible to use WIT. 
- Each module uses its own linear memory. It's not impossible, but somewhat complicated to access memory from another module. which also make the protobuf/flatbuffer approach not so desirable.
