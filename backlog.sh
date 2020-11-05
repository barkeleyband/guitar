#!/usr/bin/env bash

# NOTE: Needs pup (https://github.com/ericchiang/pup) installed

PAGE_OUTPUT=$(curl -s "$1" | pup -i 0)
TRACK_TITLE=$(echo "$PAGE_OUTPUT" | grep "twitter:title" | rev | cut -c 3- | rev)
TRACK_ARTIST=$(echo "$PAGE_OUTPUT" | grep "twitter:audio:artist_name" | rev | cut -c 3- | rev)

OUTPUT_STRING="- [${TRACK_TITLE:40}]($1) by ${TRACK_ARTIST:52}"

echo "$OUTPUT_STRING"

# awk -v s="$s" 'p{printf "\n%s\n", s; p=0} /^# /{p=1} 1' file
