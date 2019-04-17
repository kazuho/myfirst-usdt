#include <stdint.h>
#include "probe.h"

int main(int argc, char **argv)
{
    uint64_t i;
    for (i = 0; i < 5000000000; ++i)
	TEST_HELLO("hello world\n");
    TEST_DONE();
    return 0;
}
