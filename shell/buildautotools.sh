#!/bin/bash
set -xv
aclocal
libtoolize --force
autoconf
autoheader
automake --add-missing
./configure
make
#end
