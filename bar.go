package main

import (
    "fmt"
)

// export bar to make it visible to other module
//go:export bar 
func bar(a int32) int32 {
    fmt.Printf("bar from go, num: %d\n", a)
    return a
}

// main must be defined for compiling to wasi
func main(){}
