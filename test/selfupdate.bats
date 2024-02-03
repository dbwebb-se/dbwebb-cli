#!/usr/bin/env bats
#
# Tests for command: selfupdate.
#
load test_helper

@test "selfupdate" {
    run src/dbw.bash selfupdate --dry
    (( $status == 0 ))
}

@test "selfupdate execute and check version" {
    install -d build
    run src/dbw.bash selfupdate                      \
        --source file://$PWD/release/latest/install  \
        --source-bin file://$PWD/release/latest/dbw  \
        --target build
    (( $status == 0 ))

    run build/dbw --version
    (( $status == 0 ))
    [[ $( expr "$output" : "v[0-9][0-9.]*" ) ]]
}

@test "selfupdate has detailed help" {
    run src/dbw.bash help selfupdate
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"selfupdate"* ]]
}
