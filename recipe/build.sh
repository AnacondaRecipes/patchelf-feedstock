#!/bin/bash

./bootstrap.sh
./configure --prefix=${PREFIX}  \
            --host=${HOST}      \
            --build=${BUILD}
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make tests
make install
