#!/usr/bin/env bash

# NOTE: Needs spotifycli (https://github.com/masroorhasan/spotifycli) installed

TRACK_ID=$(./get-spotify-track-id.sh "$1")

spotifycli aid --tid "$TRACK_ID" --p Bass
