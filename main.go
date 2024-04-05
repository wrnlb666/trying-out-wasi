package main


import (
    "fmt"
)

// function `foo` would be defined in module `foo`, 
// `export` here actually means import for tinygo
//go:wasm-module foo
//go:export foo
func foo(int32) int32

// function `bar` would be defined in module `bar`
//go:wasm-module bar
//go:export bar
func bar(int32) int32

func main() {
    fmt.Printf("main from go, num: %d\n", foo(bar(69420)))
}
