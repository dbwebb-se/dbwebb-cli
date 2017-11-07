#!/usr/bin/env bats
#
# Tests for command: check.
#
load test_helper

@test "command check contains all details" {
    run src/dbwebb.bash check
    (( $status == 0 ))
    [[ "${lines[0]}" = "dbwebb utilities." ]]
    [[ "$output" == *"dbwebb environment."* ]]
    [[ "$output" == *"Details on installed utilities."* ]]
    [[ "$output" == *"Details on the environment."* ]]

    # Check where config is
    [[ "$output" == *"\$DBWEBB_CONFIG_DIR=$DBWEBB_CONFIG_DIR"* ]]
    [[ "$output" == *"\$DBW_CONFIG_DIR=$DBWEBB_CONFIG_DIR"* ]]
}

@test "command check has detailed help" {
    run src/dbwebb.bash help check
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"check"* ]]
}
