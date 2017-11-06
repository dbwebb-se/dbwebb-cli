#!/usr/bin/env bash
#
# dbwebb cli utility to work with dbwebb courses.
#

##
# Globals (prefer none)
# 
readonly APP_NAME="dbwebb3"
readonly DBW_CONFIG_DIR=${DBWEBB_CONFIG_DIR:-"$HOME/.dbwebb"}



##
# Print out current version
#
version()
{
    printf "v2.9.3 (2017-11-06)\\n"
}



##
# Print out how to use
#
usage()
{
    printf "\
Utility to work with dbwebb courses. Read more on:
https://dbwebb.se/dbwebb-cli/

Usage:
 %s [options] [command] [arguments]

Command:
 check                    Check and display details on local environment.
 config                   Create/update configuration file.
 help [command]           Show general help or detailed help on command.
 selfupdate               Update to latest version.

Options:
 --help, -h          Show info on usage.
 --version, -v       Show details on version.
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
%s help
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

    if [[ -f $configFile ]]; then
        while IFS='= ' read -r lhs rhs
        do
            if [[ ! $lhs =~ ^\ *# && -n $lhs ]]; then
                rhs="${rhs%%\#*}"    # Del in line right comments
                rhs="${rhs%%*( )}"   # Del trailing spaces
                rhs="${rhs%\"*}"     # Del opening string quotes 
                rhs="${rhs#\"*}"     # Del closing string quotes 
                export "$lhs"="$rhs"
            fi
        done < "$configFile"
    fi
}



##
# Create or update the configuration.
#
config_create_update()
{
    local configDir="$DBW_CONFIG_DIR"
    local configFile="$DBW_CONFIG_DIR/config"

    install -d "$configDir" \
        || fail "Could not create configuration dir: '$configDir'"
    touch "$configFile" \
        || fail "Could not create configuration file: '$configFile'"

    echo "$configDir"
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

    currentVersion="$( eval "$1" "$optionVersion" "$3" 2>&1 )"
    printf " %-10s%-10s (%s)\\n" "$1" "$currentVersion" "$( which "$1" )"
}



##
# Check details on an environment variable.
#
# @param string $1 variable to check.
#
check_environment_variable()
{
    local isSet=${!1+x}

    if [[ $isSet ]]; then
        printf " \$%s=%s\\n" "${1}" "${!1}"
    else
        printf " \$%s is not set\\n" "${1}"
    fi
}



##
# Check details on local environment
#
check_environment()
{
    local configFile="$DBW_CONFIG_DIR/config"

    printf "dbwebb utilities."
    printf "\\n------------------------------------\\n"
    check_command_version "dbwebb3" ""  "| cut -d ' ' -f 1"
    printf "\\n"
    
    printf "dbwebb environment."
    printf "\\n------------------------------------\\n"
    check_environment_variable "DBWEBB_CONFIG_DIR"
    check_environment_variable "DBW_CONFIG_DIR"
    [[ -f $configFile ]] && \
        printf " Configuration file is: %s\\n" "$configFile"
    printf "\\n"

    printf "Details on installed utilities."
    printf "\\n------------------------------------\\n"
    check_command_version "bash"  ""   "| head -1 | cut -d ' ' -f 4"
    check_command_version "curl"  ""   "| head -1 | cut -d ' ' -f 2"
    check_command_version "make"  ""   "| head -1"
    check_command_version "rsync" ""   "| head -1 | cut -d ' ' -f 4"
    check_command_version "ssh"   "-V" "| cut -d ' ' -f 1"
    check_command_version "wget"  ""   "| head -1 | cut -d ' ' -f 3"
    printf "\\n"

    printf "Details on the environment."
    printf "\\n------------------------------------"
    printf "\\n Operatingsystem:    %s" "$( uname -a )"
    printf "\\n Local user:         %s" "$USER"
    printf "\\n Local homedir:      %s" "$HOME"
    printf "\\n"
}



##
# Check details on local environment
#
app_check()
{
    check_environment
}



##
# Help for the command.
#
app_help_check()
{
    printf "\
Usage:
 %s

Help:
 Check and print out details on the current environment and
 configuration used.

 $ %s check

 Use this as a base for debugging.

Read more:
 https://dbwebb.se/dbwebb-cli/$1
" "$1" "$APP_NAME"
}



##
# Create/update the configuration directory.
#
app_config()
{
    config_create_update
}



##
# Help for the command.
#
app_help_config()
{
    printf "\
Usage:
 %s

Help:
 Create or update the configuration.

 $ %s config

 The configuration is stored in the directory \$HOME/.dbwebb and
 its location can be overridden setting the environment variable
 \$DBWEBB_CONFIG_DIR.

 You can check details on the current configuration through the
 'check' command.

Read more:
 https://dbwebb.se/dbwebb-cli/$1
" "$1" "$APP_NAME"
}



##
# Show general help information or detailed help on a command.
#
app_help()
{
    set -- "${ARGS[@]}"

    (( $# > 1 )) \
        && fail "This command only takes max one extra argument, you supplied $#."

    if (( $# == 0 )); then
        usage
        return
    fi

    if type -t app_help_"$1" | grep -q function; then
        app_help_"$1" "$1"
        exit 0
    else
        bad_usage "There is no extra help on command '$1'."
        exit 1
    fi
}



##
# Help for the command.
#
app_help_help()
{
    printf "\
Usage:
 %s [command_name]

Command:
 command_name       The command to display help for.

Help:
 The help command displays help for a given command.

 $ %s help config

Read more:
 https://dbwebb.se/dbwebb-cli/$1
" "$1" "$APP_NAME"
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
# Help for the command.
#
app_help_selfupdate()
{
    printf "\
Usage:
 %s

Help:
 Update the utility to the latest version through an automated
 installation script.

 $ %s selfupdate

 Some pre-conditions are checked and warned, but they do not
 hinder an installation.

Read more:
 https://dbwebb.se/dbwebb-cli/$1
" "$1" "$APP_NAME"
}



##
# For development and test.
#
app_develop()
{
    config_read
    echo "$DBW_HOST"
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
                readonly OPTION_VERBOSE=1
                shift
            ;;

            --silent)
                readonly OPTION_SILENT=1
                shift
            ;;

            --force | -f)
                readonly OPTION_FORCE=1
                shift
            ;;

            check       | \
            config      | \
            develop     | \
            help        | \
            selfupdate    )
                if [[ ! $COMMAND ]]; then
                    COMMAND=$1
                else
                    ARGS+=("$1")
                fi
                shift
            ;;

            -*)
                bad_usage "Unknown option '$1'."
                exit 1
            ;;

            *)
                if [[ ! $COMMAND ]]; then
                    bad_usage "Unknown command '$1'."
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
