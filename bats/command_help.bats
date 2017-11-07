#!/usr/bin/env bats
#
# Tests for command: help.
#
load test_helper

@test "command help, -h, --h shows general help" {
    local helpMessage="Utility to work with dbwebb courses. Read more on:"

    run src/dbwebb.bash -h
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]

    run src/dbwebb.bash --help
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]

    run src/dbwebb.bash help
    (( $status == 0 ))
    [[ "${lines[0]}" == "$helpMessage" ]]
}

@test "command help takes as most one extra argument" {
    run src/dbwebb.bash help a b c
    (( $status == 2 ))
}

@test "command help has detailed help" {
    run src/dbwebb.bash help help
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"help"* ]]
}
