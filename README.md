# Learning userspace DTrace

## Build

Run make (or `gmake` on FreeBSD, macOS).

Builds an executable named `test` on Linux, FreeBSD, macOS. Only tested on Linux and FreeBSD.

`test` defines two probes; `hello` and `done`.  `hello` is called many many times. `done` is called only once when the program exits.

## Tracing

### Linux

1. Start the program (`./test &`).
2. While the program is running, attach the tracer, and see what happens. `sudo trace-bpfcc -T -p $(pidof test) u:./test:done` waits for and logs the `done` probe.

### FreeBSD, macOS

```
sudo dtrace -n 'test$target:::done' -c ./test
```
