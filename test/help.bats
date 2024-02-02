#!/usr/bin/env bats
#
# Tests for command: help.
#
load test_helper

@test "help, -h, --h shows general help" {
    local helpMessage="Utility to work with course repo."

    run src/dbw.bash -h
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]

    run src/dbw.bash --help
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]

    run src/dbw.bash help
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]
}

@test "help takes as most one extra argument" {
    run src/dbw.bash help a b c
    (( $status == 2 ))
}

@test "help has detailed help" {
    run src/dbw.bash help help
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"help"* ]]
}
