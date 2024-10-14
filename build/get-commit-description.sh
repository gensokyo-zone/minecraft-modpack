#!/usr/bin/env bash
set -euxo pipefail

BRANCH=${GITHUB_REF:-$(git branch --show-current)}
BRANCH=${BRANCH#refs/*/}
echo 'COMMIT_SUBJECT<<EOF' >> $GITHUB_OUTPUT
git log -n1 ${BRANCH} --format="Commit! ${BRANCH}/%h - %s" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT
echo 'COMMIT_BODY<<EOF' >> $GITHUB_OUTPUT
git log -n1 ${BRANCH} --format="%b" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT
REF=$(git log -n1 ${BRANCH} --format="%H")
echo "COMMIT_URL=https://github.com/kittywitch/minecraft-modpack/commit/${REF}" >> $GITHUB_OUTPUT
