#!/bin/bash
set -xv

echo "Running make clean..."
if ! make clean; then
    echo "Error: 'make clean' failed." >&2
    exit 1
fi

echo "Running make distclean..."
if ! make distclean; then
    echo "Error: 'make distclean' failed." >&2
    exit 1
fi

echo "Cleaning up remaining files..."

if [ -f aclocal.m4 ]; then
    echo "Removing aclocal.m4..."
    if ! rm aclocal.m4; then
        echo "Error: Failed to remove aclocal.m4." >&2
        # Optionally exit here if this is critical
        # exit 1 
    fi
fi

if [ -d autom4te.cache ]; then
    echo "Removing autom4te.cache/..."
    if ! rm -rf autom4te.cache; then
        echo "Error: Failed to remove autom4te.cache/." >&2
        # Optionally exit here if this is critical
        # exit 1
    fi
fi

# Check for configure.in and remove it if it exists, as per original script's implicit behavior
if [ -f configure.in ]; then
    echo "Removing configure.in..."
    if ! rm configure.in; then
        echo "Error: Failed to remove configure.in." >&2
        # Optionally exit here if this is critical
        # exit 1
    fi
fi

echo "Autotools cleaning process completed."

#end
