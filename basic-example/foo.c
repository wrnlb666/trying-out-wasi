#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

// this does not need to be here, just mimicing what a `.h` file will do
__attribute__((import_module("foo"), import_name("foo")))
int32_t foo(int32_t);

int32_t foo(int32_t a) {
    printf("foo from C, num: %" PRId32 "\n", a);
    return a;
}

