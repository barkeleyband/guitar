#!/usr/bin/env bash

echo "$1" | sed -e "s/^https:\/\/open\.spotify\.com\/track\///" | cut -d "?" -f 1
