#!/bin/bash

cd ${SRC_DIR}

#./bootstrap.sh

# -V does not exist for clang
#if [[ $(uname) == Darwin ]]; then
#  sed -i'' -e 's/for ac_option in --version -v -V -qversion; do/for ac_option in --version -v -qversion; do/g' 'configure'
#fi

./configure -v --prefix=${PREFIX}  \
            --host=${HOST}      \
            --build=${BUILD}
make -j${CPU_COUNT} ${VERBOSE_AT}
if [[ $(uname) != Darwin ]]; then
  make check
  make tests
fi
make install
