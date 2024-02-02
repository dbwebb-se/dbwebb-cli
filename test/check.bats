#!/usr/bin/env bats
#
# Tests for command: check.
#
load test_helper

@test "check contains all details" {
    run src/dbw.bash check
    (( $status == 0 ))
    [[ "${lines[0]}" = "App utilities." ]]
    [[ "$output" == *"App environment."* ]]
    [[ "$output" == *"Details on installed utilities."* ]]
    [[ "$output" == *"Details on the environment."* ]]

    # Check where config is
    [[ "$output" == *"\$DBW_CONFIG_DIR=$DBW_CONFIG_DIR"* ]]
    [[ "$output" == *"\$DBW_CONFIG_FILE=$DBW_CONFIG_FILE"* ]]
}

@test "check has detailed help" {
    run src/dbw.bash help check
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"check"* ]]
}
