#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# tmux display "[INFO] tmux-aurelius: fetching a meditation"
# tmux display-message "Meditation"

main() {
    declare meditation="$($CURRENT_DIR/api.sh)"

    declare -i padding=(55-15)/2

    # display as popup
    export meditation="$meditation" padding=$padding &&
        tmux display-popup -E \
            -b "single" -S "fg=green" -h15 -w55 \
            "printf '\n%s\n\n\n\n\n\n%c\e[%db\e[30m\e[102m%s' \"${meditation}\" \" \" $padding \"<Accept>\" & \
            while true ; \
            do read -t 30 -n 1 ; \
            if [ $? = 0 ] ; then \
                exit 0 ; \
            fi ; \
            done"
}

main