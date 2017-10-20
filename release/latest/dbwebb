#!/usr/bin/env bash
#
# dbwebb cli utility to work with dbwebb courses.
#

##
# Globals (prefer none)
# 
readonly APP_NAME="dbwebb3"
readonly DBW_CONFIG_DIR=${DBW_CONFIG_DIR:-"$HOME/.dbwebb"}



##
# Print out current version
#
version()
{
    printf "v2.9.0 (2017-10-20)\\n"
}



##
# Print out how to use
#
usage()
{
    printf "\
Utility to work with dbwebb courses. Read more on:
https://dbwebb.se/dbwebb-cli/
Usage: %s [options] <command> [arguments]

Command:
 check                    Check and display details on local environment.
 config                   Create/update configuration file.
 selfupdate               Update to latest version.

Options:
 --help, -h          Show info on how to use it.
 --version, -v       Show info on how to use it.
 --force, -f         Force potential dangerous operation.
" "$APP_NAME"
}



##
# Print out how to use
#
# @param string $1 error message to display.
#
bad_usage()
{
    [[ $1 ]] && printf "%s\\n" "$1"

    printf "\
For an overview of the command, execute:
%s --help
" "$APP_NAME"
}



##
# Error while processing
#
# @param string $* error message to display.
#
fail()
{
    local red
    local normal

    red=$(tput setaf 1)
    normal=$(tput sgr0)

    printf "%s %s\\n" "${red}[FAILED]${normal}" "$*"
    exit 2
}



##
# Check if command is installed
#
# @param string $1 the command to check.
#
function has_command() {
    if ! hash "$1" 2> /dev/null; then
        return 1
    fi
    return 0
}



##
# Print confirmation message with default values.
#
# @param string $1 the message to display or use default.
# @param string $2 the default value for the response.
#
confirm()
{
    read -r -p "${1:-Are you sure? [yN]} "
    case "${REPLY:-$2}" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}



##
# Read input from user supporting a default value for reponse.
#
# @param string $1 the message to display.
# @param string $1 the default value.
#
input()
{
    read -r -p "$1 [$2]: "
    echo "${REPLY:-$2}"
}



##
# Read the configuration if it exists or silently ignore it.
#
config_read()
{
    local configDir="$DBW_CONFIG_DIR"
    local configFile="$DBW_CONFIG_DIR/config"

    # shellcheck source=/dev/null
    [[ -f $configFile ]] && . "$configFile"
}



##
# Create or update the configuration.
#
config_create()
{
    local configDir="$DBW_CONFIG_DIR"
    local configFile="$DBW_CONFIG_DIR/config"

    install -d "$configDir" \
        || fail "Could not create configuration dir: '$configDir'"
    touch "$configFile" \
        || fail "Could not create configuration file: '$configFile'"
    ls -l "$configDir"
}



##
# Check details on a command and display its version.
#
# @param string $1 command to check.
# @param string $2 optionally extra string to extract version number.
# @param string $3 optionally extra string to extract version number.
#
check_command_version()
{
    local optionVersion=${2:-"--version"}
    local currentVersion=

    currentVersion="$( eval $1 $optionVersion $3 2>&1 )"
    printf " %-10s%-10s (%s)\\n" "$1" "$currentVersion" "$( which $1 )"
}



##
# Check details on local environment
#
# @param string $1 tools to check, separated with space.
#
check_environment()
{
    local red
    local normal
    local tools=$1

    red=$(tput setaf 1)
    normal=$(tput sgr0)

    printf "dbwebb utilities."
    printf "\n------------------------------------\n"
    check_command_version "dbwebb3" ""  "| cut -d ' ' -f 1"
    printf "\n"

    printf "Details on installed utilities."
    printf "\n------------------------------------\n"
    check_command_version "bash"  ""   "| head -1 | cut -d ' ' -f 4"
    check_command_version "ssh"   "-V" "| cut -d ' ' -f 1"
    check_command_version "rsync" ""   "| head -1 | cut -d ' ' -f 4"
    check_command_version "wget"  ""   "| head -1 | cut -d ' ' -f 3"
    check_command_version "curl"  ""   "| head -1 | cut -d ' ' -f 2"
    printf "\n"

    printf "Details on the environment."
    printf "\n------------------------------------"
    printf "\n Operatingsystem:    %s" "$( uname -a )"
    printf "\n Local user:         %s" "$USER"
    printf "\n Local homedir:      %s" "$HOME"
    printf "\n"
}



##
# Check details on local environment
#
app_check()
{
    check_environment "bash wget curl rsync git make"
}



##
# Create/update the configuration directory.
#
app_config()
{
    config_create
}



##
# Selfupdate to latest version.
#
app_selfupdate()
{
    local tmp="/tmp/dbwebb-cli.$$"
    local url="https://raw.githubusercontent.com/dbwebb-se/dbwebb-cli/master/release/latest/install"

    if ! curl --fail --silent "$url" > "$tmp"; then
        rm -f "$tmp"
        fail "Could not download installations program. You need curl and a network connection."
    fi
    bash < "$tmp"
    rm -f "$tmp"
}



##
# For development and test.
#
app_develop()
{
    :
}



#
# Always have a main
# 
main()
{
    # Parse incoming options and arguments
    while (( $# )); do
        case "$1" in
            --help | -h)
                usage
                exit 0
            ;;

            --version | -v)
                version
                exit 0
            ;;

            --verbose)
                readonly OPTION_VERBOSE=true
                shift
            ;;

            --silent)
                readonly OPTION_SILENT=true
                shift
            ;;

            --force | -f)
                readonly OPTION_FORCE=1
                shift
            ;;

            check       | \
            config      | \
            develop     | \
            selfupdate    )
                COMMAND=$1
                shift
            ;;

            -*)
                bad_usage "Unknown option '$1'."
                exit 1
            ;;

            *)
                if [[ ! $COMMAND ]]; then
                    bad_usage "Unknown command/argument '$1'."
                    exit 1
                fi
                ARGS+=("$1")
                shift
            ;;
        esac
    done



    # Execute the command 
    if type -t app_"$COMMAND" | grep -q function; then
        app_"$COMMAND"
    else
        bad_usage "Missing option or command."
        exit 1
    fi
}



main "$@"
