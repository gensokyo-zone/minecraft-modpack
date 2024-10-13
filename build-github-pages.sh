#!/usr/bin/env bash
set -euxo pipefail

BUILD_DIR=$(mktemp -dt "minecraft-modpack-build-XXXX")
REVISION=$(git rev-parse --short HEAD)

git fetch origin
git worktree add pages pages

mkdir -p pages/marka-1.20
cp -r $(git ls-files) ./pages/marka-1.20/

GIT_PREFIX="-C pages/"
git ${GIT_PREFIX} add -A

export GIT_{COMMITTER,AUTHOR}_EMAIL="github-actions@gensokyo.zone"
export GIT_{COMMITTER,AUTHOR}_NAME="GitHub Actions"

git ${GIT_PREFIX} commit -m "Synchronize from marka-1.20/${REVISION}"
git ${GIT_PREFIX} push origin HEAD:pages