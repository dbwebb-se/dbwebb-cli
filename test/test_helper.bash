#!/usr/bin/env bats
#
# Bats setup and teardown functions.
#
setup()
{
    export DBWEBB_CONFIG_DIR="$PWD/build/.dbwebb"
    install -d build/bin
}

teardown()
{
    rm -rf build/.dbwebb
    rm -rf build/bin
    unset DBWEBB_CONFIG_DIR
}
