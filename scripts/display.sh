#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# tmux display "[INFO] tmux-aurelius: fetching a meditation"
# tmux display-message "Meditation"

main() {
    meditation="$($CURRENT_DIR/api.sh)"
    # display in the current pane
    # echo ${meditation}

    # display as popup
    export meditation="$meditation" &&
        tmux display-popup -E -b "double" -h15 -w55 "printf '\n%s\n\n\n' \"${meditation}\" & \
            while true ; do read -t 30 -n 1 ; if [ $? = 0 ] ; then exit 0 ; fi ; done"
}

main