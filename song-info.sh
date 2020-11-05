#!/usr/bin/env bash

# NOTE: Needs pup (https://github.com/ericchiang/pup) installed

PAGE_OUTPUT=$(curl -s "$1" | pup -i 0)
TRACK_TITLE=$(echo "$PAGE_OUTPUT" | grep "twitter:title" | cut -c 41- | rev | cut -c 3- | rev)
TRACK_ARTIST=$(echo "$PAGE_OUTPUT" | grep "twitter:audio:artist_name" | cut -c 52- | rev | cut -c 3- | rev)

OUTPUT_STRING="- [$TRACK_TITLE]($1) by $TRACK_ARTIST ([tab](https://www.ultimate-guitar.com/search.php?search_type=title&value=$TRACK_TITLE))"

echo "$OUTPUT_STRING"

# awk -v s="$s" 'p{printf "\n%s\n", s; p=0} /^# /{p=1} 1' file
