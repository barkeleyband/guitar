#!/usr/bin/env bash

SONG=$(./song-info.sh "$1")
awk -v s="$SONG" 'p{printf "\n%s", s; p=0} /^## Guitar Songs Backlog/{p=1} 1' README.md > TMP.md
mv TMP.md README.md
./commit.sh
