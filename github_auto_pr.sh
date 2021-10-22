#!/bin/bash


BRANCH=$(git rev-parse --abbrev-ref HEAD)
TICKET=$(git rev-parse --abbrev-ref HEAD | cut -d- -f-2)
DESC=$1
TEST=$2
#REVIEWERS=$3

echo "
$BRANCH

## Description
$DESC

[$TICKET](https://exigertech.jira.com/browse/$TICKET)

## Testing
$TEST

" > ~/prepared-message.md

git push --set-upstream origin $BRANCH
hub pull-request -c -F ~/prepared-message.md #-r "$REVIEWERS"
