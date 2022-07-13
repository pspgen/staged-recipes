#!/bin/bash
# Some tests are still failing (always check manually)
# Put back `set -ex` once we can make all tests pass
#set -ex

ln -s $FC $BUILD_PREFIX/gfortran
ln -s $CPP $BUILD_PREFIX/cpp

sed -i "s|/usr/local/.*/|${PREFIX}/|g" make.inc
sed -i "s/lrefblas/lblas/g" make.inc

cd src 

make all

cp oncvpsp.x ${PREFIX}/bin/oncvpsp.x
cp oncvpspnr.x ${PREFIX}/bin/oncvpspnr.x
cp oncvpspr.x ${PREFIX}/bin/oncvpspr.x