#!/usr/bin/env bash

if [ -z "$1" ]
then
	SONG=$(./get-current-song-spotify-link.sh)
else
	SONG="$1"
fi

TRACK_ID=$(./get-spotify-track-id.sh "$SONG")
if sed -n '/Bass Song Collection/,//p' README.md | grep -q "$TRACK_ID"
then
	echo "Song already added to bass list"
	exit
fi

SONG_INFO=$(./song-info.sh "$SONG")
awk -v s="$SONG_INFO" 'p{printf "\n%s", s; p=0} /^## Bass Songs Backlog/{p=1} 1' README.md > TMP.md
mv TMP.md README.md
./add-to-spotify-bass.sh "$SONG"
./commit.sh
