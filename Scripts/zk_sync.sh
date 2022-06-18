#!/bin/bash

ZK_PATH="/Users/gautam/Documents/PKM/"

cd "$ZK_PATH"

CHANGES_EXIST="$(git status --porcelain | wc -l)"

if [ "$CHANGES_EXIST" -eq 0 ]; then
    exit 0
fi

git pull
git add .
git commit -m "Last Sync: $(date +"%Y-%m-%d %H:%M:%S")"
git push
