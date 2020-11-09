#!/usr/bin/env bash

# NOTE: Needs spotifycli (https://github.com/masroorhasan/spotifycli) installed

TRACK_ID=$(echo "$1" | sed -e "s/^https:\/\/open\.spotify\.com\/track\///" | cut -d "?" -f 1)

spotifycli aid --tid "$TRACK_ID" --p Guitar
