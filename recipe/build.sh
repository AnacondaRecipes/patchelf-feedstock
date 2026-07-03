#!/bin/bash

set -ex

cd ${SRC_DIR}

# to fix configure version mismatch
autoreconf -fi

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

./configure --prefix=${PREFIX}  \
            --host=${HOST}      \
            --build=${BUILD}
make -j${CPU_COUNT} ${VERBOSE_AT}

if [[ $(uname) != Darwin ]]; then
  make check
  make tests
fi

make install
