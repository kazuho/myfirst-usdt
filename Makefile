DTRACE=dtrace
UNAME=$(shell uname)

COPTS=-Wall -g -O2
OBJS=test.o
ifeq ($(UNAME),Linux)
	OBJS+=probe.o
endif

.c.o:
	$(CC) -c $(COPTS) $<

test: $(OBJS) probe.h
	$(CC) -o $@ $(OBJS)

probe.h: probe.d
	$(DTRACE) -o $@ -s $< -h

# linux-only
probe.o: probe.d
	$(DTRACE) -o $@ -s $< -G

clean:
	@rm -f test $(OBJS) probe.h probe.o

.PHONY: clean
