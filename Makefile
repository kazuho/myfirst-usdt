DTRACE=dtrace
UNAME=$(shell uname)

COPTS=-Wall -g -O2
OBJS=test.o
ifneq ($(UNAME),Darwin)
	OBJS+=probe.o
endif

.c.o:
	$(CC) -c $(COPTS) $<

test: probe.h $(OBJS)
	$(CC) -o $@ $(OBJS)

probe.h: probe.d
	$(DTRACE) -o $@ -s $< -h

# Darwin does not require this
probe.o: probe.d
	$(DTRACE) -o $@ -s $< -G

clean:
	@rm -f test $(OBJS) probe.h probe.o

.PHONY: clean
