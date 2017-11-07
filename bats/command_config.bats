#!/usr/bin/env bats
#
# Tests for command: config.
#
load test_helper

@test "command config contains all details" {
    run src/dbwebb.bash config
    (( $status == 0 ))
    [[ "${lines[0]}" = "$DBWEBB_CONFIG_DIR" ]]
}

@test "command config has detailed help" {
    run src/dbwebb.bash help config
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"config"* ]]
}
