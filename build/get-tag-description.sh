#!/usr/bin/env bash
set -euxo pipefail

BRANCH=${GITHUB_REF:-$(git branch --show-current)}
BRANCH=${BRANCH#refs/*/}
echo 'TAG_DATA<<EOF' >> $GITHUB_OUTPUT
git tag -n1 "$BRANCH" --format=$'# %(refname:lstrip=2) - %(contents:subject)\n\n%(contents:body)' >> $GITHUB_OUTPUT
echo -n >> $GITHUB_OUTPUT
echo "[Download](https://github.com/kittywitch/minecraft-modpack/releases/tag/${BRANCH})" >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT