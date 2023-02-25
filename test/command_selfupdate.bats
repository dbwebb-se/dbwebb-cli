#!/usr/bin/env bats
#
# Tests for command: selfupdate.
#
load test_helper

@test "command selfupdate" {
    run src/dbwebb.bash selfupdate --dry
    (( $status == 0 ))
}

@test "command selfupdate execute and check version" {
    run src/dbwebb.bash selfupdate                 \
        --source file:///$PWD/src/install.bash     \
        --source-bin file:///$PWD/src/dbwebb.bash  \
        --target build/bin
    (( $status == 0 ))

    run build/bin/dbw --version
    (( $status == 0 ))
    [[ $( expr "$output" : "v[0-9][0-9.]*" ) ]]
}

@test "command selfupdate has detailed help" {
    run src/dbwebb.bash help selfupdate
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"selfupdate"* ]]
}
