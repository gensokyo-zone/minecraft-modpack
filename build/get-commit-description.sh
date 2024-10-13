#!/usr/bin/env bash
set -euxo pipefail

git fetch --tags --force
BRANCH=${GITHUB_REF:-$(git branch --show-current)}
BRANCH=${BRANCH#refs/*/}
echo 'TAG_SUBJECT<<EOF' >> $GITHUB_OUTPUT
git log -n1 marka-1.20 --format="Commit! %h - %s" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT
echo 'TAG_BODY<<EOF' >> $GITHUB_OUTPUT
git log -n1 marka-1.20 --format="%b" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT
REF=$(git log -n1 marka-1.20 --format="%H")
echo "TAG_URL=https://github.com/kittywitch/minecraft-modpack/commit/${REF}" >> $GITHUB_OUTPUT
