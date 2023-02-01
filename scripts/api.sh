#!/usr/bin/env bash

get_meditation() {
    meditation="$(curl https://stoicquotesapi.com/v1/api/quotes/random)"
    echo ${meditation}
}

main() {
    get_meditation
}

main