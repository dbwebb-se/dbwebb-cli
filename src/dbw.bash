#!/usr/bin/env bash

# shellcheck source=/dev/null
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
. "$SCRIPT_DIR/dbw_functions.bash"

main "$@"
