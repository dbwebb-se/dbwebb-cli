#!/usr/bin/env bats
#
# Tests for command: config.
#
load test_helper

@test "config contains all details" {
    run src/dbw.bash config
    (( $status == 0 ))

    run src/dbw.bash check
    (( $status == 0 ))
    [[ "$output" == *"\$DBW_CONFIG_DIR=$DBW_CONFIG_DIR"* ]]
    [[ "$output" == *"\$DBW_CONFIG_FILE=$DBW_CONFIG_FILE"* ]]
}

@test "config has detailed help" {
    run src/dbw.bash help config
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"config"* ]]
}
