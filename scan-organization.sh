#!/bin/bash

USERS=$(curl -s -H "application/vnd.github.hellcat-preview+json" -H "Authorization: token [GITHUB_TOKEN]" https://api.github.com/orgs/"$1"/members | jq -r .[].login);

while read -r USER; do
  python `pwd`/main.py "$USER" 1 2>/dev/null;
  python `pwd`/main.py "$USER" 2 2>/dev/null;
  python `pwd`/main.py "$USER" 3 2>/dev/null;
done <<< "$USERS"
