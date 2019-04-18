#include <stdint.h>
#include "probe.h"

int main(int argc, char **argv)
{
    uint64_t i;
    for (i = 0; i < 5000000000; ++i) {
        if (TEST_HELLO_ENABLED())
	    TEST_HELLO("hello world\n");
    }
    if (TEST_DONE_ENABLED())
        TEST_DONE();
    return 0;
}
