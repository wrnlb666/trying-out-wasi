#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

// typically in a `.h` file, but I am lazy
__attribute__((import_module("foo"), import_name("foo")))
int32_t foo(int32_t);

// since `bar` is defined in a go file, have to define it manually
__attribute__((import_module("bar"), import_name("bar")))
int32_t bar(int32_t);

int main(int argc, char **argv) {
    printf("main from C, num: %" PRId32 "\n", foo(bar(69420)));
    return 0;
}

