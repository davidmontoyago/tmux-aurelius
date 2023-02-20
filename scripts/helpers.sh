#!/usr/bin/env bash

# https://stackoverflow.com/a/46324904/998181
function json_extract() {
  local key=$1
  local json=$2

  local string_regex='"([^"\]|\\.)*"'
  local number_regex='-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?'
  local value_regex="${string_regex}|${number_regex}|true|false|null"
  local pair_regex="\"${key}\"[[:space:]]*:[[:space:]]*(${value_regex})"

  if [[ ${json} =~ ${pair_regex} ]]; then
    # shellcheck disable=SC2001
    sed 's/^"\|"$//g' <<< "${BASH_REMATCH[1]}"
  else
    return 1
  fi
}