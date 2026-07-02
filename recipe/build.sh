#!/bin/bash

cd ${SRC_DIR}

# to fix configure version mismatch
autoreconf

./configure --prefix=${PREFIX}  \
            --host=${HOST}      \
            --build=${BUILD}
make -j${CPU_COUNT} ${VERBOSE_AT}

make check
make tests

make install
