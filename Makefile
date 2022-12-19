################################
### FreeSwitch headers files found in libfreeswitch-dev ###
FS_INCLUDES=/usr/include/freeswitch
FS_MODULES=/usr/lib/freeswitch/mod
################################

### END OF CUSTOMIZATION ###
SHELL := /bin/bash
PROC?=$(shell uname -m)
CMAKE := cmake

CFLAGS=-fPIC -O3 -fomit-frame-pointer -fno-exceptions -Wall -std=c99 -pedantic

INCLUDES=-I/usr/include -I$(FS_INCLUDES)
LDFLAGS=-lm -Wl,-static -Wl,-Bdynamic

all : mod_vad.o
	$(CC) $(CFLAGS) $(INCLUDES) -shared -Xlinker -x -o mod_vad.so mod_vad.o $(LDFLAGS)

mod_vad.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c mod_vad.c

clean:
	rm -f *.o *.so *.a *.la

install: all
	/usr/bin/install -c mod_vad.so $(INSTALL_PREFIX)/$(FS_MODULES)/mod_vad.so
