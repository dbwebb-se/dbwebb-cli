#!/usr/bin/env bats
#
# Tests for main script.
#
load test_helper

@test "main no arguments prints missing command" {
    run src/dbwebb.bash
    (( $status == 1 ))
    [[ "${lines[0]}" = "Missing option or command." ]]
}

@test "main -v, --version show version" {
    local versionNumber="v[0-9][0-9.]*"

    run src/dbwebb.bash -v
    (( $status == 0 ))
    [[ $( expr "$output" : "$versionNumber" ) ]]

    run src/dbwebb.bash --version
    (( $status == 0 ))
    [[ $( expr "$output" : "$versionNumber" ) ]]
}
