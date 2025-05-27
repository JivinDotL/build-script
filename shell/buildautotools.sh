#!/bin/bash
set -xv

# Capture all command-line arguments
ARGS="$@"

echo "Running aclocal..."
aclocal
if [ $? -ne 0 ]; then
    echo "Error: aclocal failed." >&2
    exit 1
fi

echo "Running libtoolize --force..."
libtoolize --force
if [ $? -ne 0 ]; then
    echo "Error: libtoolize --force failed." >&2
    exit 1
fi

echo "Running autoconf..."
autoconf
if [ $? -ne 0 ]; then
    echo "Error: autoconf failed." >&2
    exit 1
fi

echo "Running autoheader..."
autoheader
if [ $? -ne 0 ]; then
    echo "Error: autoheader failed." >&2
    exit 1
fi

echo "Running automake --add-missing..."
automake --add-missing
if [ $? -ne 0 ]; then
    echo "Error: automake --add-missing failed." >&2
    exit 1
fi

echo "Running ./configure $ARGS ..."
# shellcheck disable=SC2086 # We want word splitting for ARGS
./configure $ARGS
if [ $? -ne 0 ]; then
    echo "Error: ./configure $ARGS failed." >&2
    exit 1
fi

echo "Running make $ARGS ..."
# shellcheck disable=SC2086 # We want word splitting for ARGS
make $ARGS
if [ $? -ne 0 ]; then
    echo "Error: make $ARGS failed." >&2
    exit 1
fi

echo "Build process completed successfully."
#end
