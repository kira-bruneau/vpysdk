#!/bin/bash

### Reset build and vpysdk environment ###
rm -rf build/
mkdir -p build/vpysdk/

### Compile swig ###
swig -python -o build/vpysdk_wrap.c -outdir build/vpysdk/ -Iinclude/ swig/main.i
gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -fPIC -Iinclude/ -I/usr/include/python2.7 -c build/vpysdk_wrap.c -o build/vpysdk_wrap.o
gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -Wl,-z,relro -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -D_FORTIFY_SOURCE=2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security build/vpysdk_wrap.o -Llib -Wl,-R\$ORIGIN -lvpsdk -o build/vpysdk/_vpysdk.so

cp lib/libvpsdk.so build/vpysdk/
touch build/vpysdk/__init__.py

# Remove uneeded symbols
strip --strip-unneeded build/vpysdk/*.so

rm -rf demo/lib/
mkdir -p demo/lib/
cp -R build/vpysdk/* demo/lib
