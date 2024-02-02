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
    run src/dbw.bash selfupdate                 \
        --source file:///$PWD/src/install.bash     \
        --source-bin file:///$PWD/src/dbw.bash  \
        --target build/bin
    (( $status == 0 ))

    run build/bin/dbw --version
    (( $status == 0 ))
    [[ $( expr "$output" : "v[0-9][0-9.]*" ) ]]
}

@test "selfupdate has detailed help" {
    run src/dbw.bash help selfupdate
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"selfupdate"* ]]
}
