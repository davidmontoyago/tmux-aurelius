#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

get_meditation() {
    meditation="$(curl https://stoicquotesapi.com/v1/api/quotes/random)"

    quote="$(json_extract "body" "${meditation}")"
    quote="${quote%\"}"
    quote="${quote#\"}"

    author="$(json_extract "author" "${meditation}")"
    author="${author%\"}"
    author="${author#\"}"

    echo "${quote} --${author}"
}

main() {
    get_meditation
}

main