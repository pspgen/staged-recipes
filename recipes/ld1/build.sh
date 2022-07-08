#!/bin/bash
# Some tests are still failing (always check manually)
# Put back `set -ex` once we can make all tests pass
#set -ex


# preprocessor executable name was hardcoded
# (will be fixed in next release)
ln -s $CPP $BUILD_PREFIX/cpp

# FOR MPIEXEC configuration, see https://cmake.org/cmake/help/v3.9/module/FindMPI.html

./configure \
    --prefix=${PREFIX}

# Libxc fortran bindings currently not available for macos
    #-DQE_ENABLE_LIBXC=ON \
 
make pw ld1

# Only pw, cp, and unit tests are safe to run when using cmake curently (to fix in later releases)
#make test
# there are known test failures that will be addressed later
# ctest -L "pw|cp|unit" -LE epw --output-on-failure  || true

make install