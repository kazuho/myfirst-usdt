# Learning userspace DTrace

## Build

Run make (or `gmake` on macOS).

Builds an executable named `test` on Linux and macOS. Only tested on Linux.

`test` defines two probes; `hello` and `done`.  `hello` is called many many times. `done` is called only once when the program exits.

## Tracing

1. Start the program (`./test &`).
2. While the program is running, attach the tracer, and see what happens.
  * on Linux, `sudo trace-bpfcc -T -p $(pidof test) u:./test:done` waits for and logs the `done` probe.
    * specify the hello probe, and see what happens
  * on macOS, you should be able to use the dtrace(1) for tracing the probes.
