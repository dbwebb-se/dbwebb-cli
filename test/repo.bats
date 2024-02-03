#!/usr/bin/env bats
#
# Tests for command: repo.
#
load test_helper

@test "repo exists" {
    run src/dbw.bash repo
    (( $status == 0 ))
}

@test "repo has detailed help" {
    run src/dbw.bash help repo
    (( $status == 0 ))
    [[ "${lines[0]}" = "Usage:" ]]
    [[ "${lines[1]}" == *"repo"* ]]
}

@test "repo finds the default configuration with a course name" {
    run src/dbw.bash repo
    (( $status == 0 ))
    [[ "${lines[0]}" = *"template"* ]]
}

@test "repo has a value for REPO_COURSE" {
    source src/dbw_functions.bash
    run app_repo
    (( $status == 0 ))
    [[ "${lines[0]}" = *"template"* ]]
    
    # env
    # run : ${REPO_CONFIG_FILE?"The REPO_CONFIG_FILE is not set"}
    # (( $status == 0 ))

    # run : ${REPO_COURSE?"The REPO_COURSE is not set"}
    # (( $status == 0 ))

    # run echo "$REPO_COURSE"
    # [[ "${lines[0]}" = *"template"* ]]
}

@test "repo finds command 'dummy'" {
    run src/dbw.bash dummy
    (( $status == 0 ))
}

@test "repo does not find command 'dummy_no'" {
    run src/dbw.bash dummy_no
    (( $status == 1 ))
}

@test "fail to find command when REPO_CONFIG_FILE is missing" {
    source src/dbw_functions.bash
    run export REPO_CONFIG_FILE=
    (( $status == 0 ))
    run repo_command_exists gui
    [[ ! "${lines[0]}" ]]
}

# @test "command commands finds and reads configuration" {
#     run src/dbw.bash commands
#     (( $status == 0 ))

#     # verify DBW_COURSE is set
# }

# @test "command commands finds and reads configuration using --target" {
#     run src/dbw.bash commands --target test
#     (( $status == 0 ))

#     # verify DBW_COURSE is set
# }

# @test "command commands --verbose displays details" {
#     run src/dbw.bash commands --verbose
#     (( $status == 0 ))
#     [[ "${lines[0]}" == "Course dir found:"* ]]
# }

# @test "command commands --target invalid start directory" {
#     run src/dbw.bash commands --target /not_existing
#     (( $status == 2 ))
#     [[ "${lines[0]}" == *"not a valid start"* ]]
# }

