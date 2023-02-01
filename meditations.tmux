#!/usr/bin/env bash

# Get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PID_DIR=~/.tmux/meditations

# prepare pid file directory
if [[ ! -d $PID_DIR ]]; then
  mkdir $PID_DIR
fi

# Bind plugin keys
tmux bind-key G run-shell "$CURRENT_DIR/scripts/display.sh"