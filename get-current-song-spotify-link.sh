#!/usr/bin/env bash

SONG_ID=$(spotifycli now | awk '{print $1}' | awk 'NR>4' | head -n 1)

echo "https://open.spotify.com/track/$SONG_ID"
