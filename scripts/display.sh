#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# for log keeping with 'tmux show-messages'
tmux display "[INFO] tmux-aurelius: fetching a meditation"
tmux display-message "Meditation"

main() {
    meditation="$($CURRENT_DIR/api.sh)"
    # display in the current pane
    echo ${meditation}
}

main