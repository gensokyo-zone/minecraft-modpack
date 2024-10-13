#!/usr/bin/env bash
set -euxo pipefail

BRANCH=${GITHUB_REF:-$(git branch --show-current)}
BRANCH=${BRANCH#refs/*/}

echo 'TAG_DATA<<EOF' >> $GITHUB_OUTPUT
git tag -n1 "$BRANCH" --format=$'# %(refname:lstrip=2) - %(contents:subject)\n\n%(contents:body)' >> $GITHUB_OUTPUT
echo 'EOF' >> $GITHUB_OUTPUT