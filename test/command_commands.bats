#!/usr/bin/env bats
#
# Tests for command: help.
#
load test_helper

@test "command commands exists" {
    run src/dbwebb.bash commands
    (( $status == 0 ))
}

@test "command config has detailed help" {
    run src/dbwebb.bash help commands
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"commands"* ]]
}

@test "command commands finds and reads configuration" {
    run src/dbwebb.bash commands
    (( $status == 0 ))

    # verify DBW_COURSE is set
}

@test "command commands finds and reads configuration using --target" {
    run src/dbwebb.bash commands --target test
    (( $status == 0 ))

    # verify DBW_COURSE is set
}

@test "command commands --verbose displays details" {
    run src/dbwebb.bash commands --verbose
    (( $status == 0 ))
    [[ "${lines[0]}" == "Course dir found:"* ]]
}

@test "command commands --target invalid start directory" {
    run src/dbwebb.bash commands --target /not_existing
    (( $status == 2 ))
    [[ "${lines[0]}" == *"not a valid start"* ]]
}

