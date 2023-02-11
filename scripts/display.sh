#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# tmux display "[INFO] tmux-aurelius: fetching a meditation"
# tmux display-message "Meditation"

main() {
    declare -a apis
    # enumerate here source apis
    apis[0]="$CURRENT_DIR/api/v1.sh"
    apis[1]="$CURRENT_DIR/api/v2.sh"

    # pick a random api
    declare size=${#apis[@]}
    declare index=$(($RANDOM % $size))
    declare api="${apis[$index]}"

    # invoke the api
    declare meditation=$($api)

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