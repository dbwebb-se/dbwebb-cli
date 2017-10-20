#!/usr/bin/env bats

load test_helper

@test "no arguments prints missing command" {
    run src/dbwebb.bash
    [ $status -eq 1 ]
    [ $(expr "${lines[0]}" : "Missing command.") -ne 0 ]
}

@test "-v show version" {
    run src/dbwebb.bash -v
    [ $status -eq 0 ]
    [ $(expr "$output" : "v[0-9][0-9.]*") -ne 0 ]
}

@test "--version show version" {
    run src/dbwebb.bash --version
    [ $status -eq 0 ]
    [ $(expr "$output" : "v[0-9][0-9.]*") -ne 0 ]
}
