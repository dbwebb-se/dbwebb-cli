# Needs to be executed from dbw utility

###############################################################################
# Preconditions.
#
has_command dialog \
    || fail "Install 'dialog' using your packet manager (apt-get|brew install dialog)."



###############################################################################
# Globals.
#
readonly BACKTITLE="dbw gui: $REPO_COURSE"
readonly TITLE="Title"



###############################################################################
# Gui.
#

##
# A message box.
#
# @param string $1 title of the window.
# @param string $2 message to display.
#
gui_messagebox()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$1" \
        --msgbox "$2" \
        24 80 \
        3>&1 1>&2 2>&3 3>&-
}



##
# A input box.
#
# @param string $1 title of the window.
# @param string $2 title of the inputbox.
# @param string $3 default value to display in the inputbox.
#
gui_inputbox()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$1" \
        --inputbox "$2" \
        24 80 \
        "$3" \
        3>&1 1>&2 2>&3 3>&-
}



###############################################################################
# Application.
#

gui_messagebox "The first window" "Hello world!"

acronym=$( gui_inputbox "Input a value" "Select student acronym (ctrl-u to clear)" "" )
echo $acronym