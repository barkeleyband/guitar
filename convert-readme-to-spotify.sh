#!/usr/bin/env bash

grep -o "https://open.spotify.com/[^)]*" README.md | while read -r SONG_LINK ; do
	./add-to-spotify.sh "$SONG_LINK"
done
