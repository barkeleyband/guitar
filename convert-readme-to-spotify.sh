#!/usr/bin/env bash

sed -n '/Guitar Song Collection/,/Bass Song Collection/p' README.md | grep -o "https://open.spotify.com/[^)]*" | while read -r SONG_LINK ; do
	./add-to-spotify-guitar.sh "$SONG_LINK"
done

sed -n '/Bass Song Collection/,//p' README.md | grep -o "https://open.spotify.com/[^)]*" | while read -r SONG_LINK ; do
	./add-to-spotify-bass.sh "$SONG_LINK"
done
