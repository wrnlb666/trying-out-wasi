CC = clang
# This is the location for my sysroot, it might be different for you. 
SYSROOT ?= /usr/share/wasi-sysroot/
# targeting to `wasm32-wasi` for clang, allow undefined to avoid linker error
CFLAG = --sysroot=$(SYSROOT) --target=wasm32-wasi -Wl,--allow-undefined

all: foo bar cmain gomain run

foo: foo.c 
	@ $(CC) $(CFLAG) $< -o $@.wasm -Wl,--export=foo -Wl,--no-entry

bar: bar.go
	@ tinygo build -target=wasi -o bar.wasm ./bar.go

gomain: main.c 
	@ tinygo build -target=wasi -o gomain.wasm ./main.go
	
cmain: main.c
	@ $(CC) $(CFLAG) $< -o cmain.wasm 

# simple usage for `wasmtime`, 
# `--preload` means to preload a module for future usage, in this case, dynamic linkage at runtime
# `--preload foo=foo.wasm` means that I have a file `foo.wasm`, 
# I want it to be loaded with name `foo`
run:
	@ echo -e "c result:" 
	@ wasmtime --preload foo=foo.wasm --preload bar=bar.wasm cmain.wasm
	@ echo -e
	@ echo -e "go result:" 
	@ wasmtime --preload foo=foo.wasm --preload bar=bar.wasm gomain.wasm

clean: 
	- rm *.wasm *.json

