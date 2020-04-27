#!/bin/bash
set -xv

##Clean generate files by Makefile
make clean
##Clean Makefile
make distclean

##backup
cp configure.ac configure.ac.bak
cp configure.in configure.in.bak
cp Makefile.am Makefile.am.bak

##aclocal
rm -rf aclocal.m4
rm -rf autom4te.cache
rm -rf autoscan.log

##autoheader
rm -rf config.h.in

##libtoolize
rm -rf ltmain.sh

##automake -a
rm -rf install-sh
rm -rf missing
rm -rf depcomp

##.configure
rm -rf config.guess
rm -rf Makefile.in
rm -rf stamp-h1
rm -rf .deps
rm -rf configure
rm -rf config.sub
rm -rf config.status
rm -rf configure.scan
rm -rf configure.in

rm -rf compile
rm -rf config.log


#end
