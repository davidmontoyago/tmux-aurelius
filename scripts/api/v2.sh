#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# shellcheck source=./scripts/helpers.sh
source "$CURRENT_DIR/../helpers.sh"

get_quote() {
    # See https://github.com/benhoneywill/stoic-quotes
    meditation="$(curl https://stoic-quotes.com/api/quote)"

    quote="$(json_extract "text" "${meditation}")"
    quote="${quote%\"}"
    quote="${quote#\"}"

    author="$(json_extract "author" "${meditation}")"
    author="${author%\"}"
    author="${author#\"}"

    printf ' %s\n\n%s' "${quote}" "${author}" | fold -s -w 50 | sed -e "2,\$s/^/ /"
}

main() {
    get_quote
}

main