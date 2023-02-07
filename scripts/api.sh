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

    printf ' %s\n\n%s' "${quote}" "${author}" | fold -s -w 50 | sed -e "2,\$s/^/ /"
}

main() {
    get_meditation
}

main