#!/usr/bin/env bash

if [ -z "$1" ]
then
	SONG=$(./get-current-song-spotify-link.sh)
else
	SONG="$1"
fi

SONG_INFO=$(./song-info.sh "$SONG")
awk -v s="$SONG_INFO" 'p{printf "\n%s", s; p=0} /^## Guitar Songs Backlog/{p=1} 1' README.md > TMP.md
mv TMP.md README.md
./add-to-spotify-guitar.sh "$SONG"
./commit.sh
