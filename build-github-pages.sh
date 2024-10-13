#!/usr/bin/env bash
set -euxo pipefail

BUILD_DIR=$(mktemp -dt "minecraft-modpack-build-XXXX")
REVISION=$(git rev-parse --short HEAD)
BRANCH=${GITHUB_REF:-$(git branch --show-current)}
BRANCH=${BRANCH#refs/*/}

git fetch origin
git worktree add pages pages

mkdir -p pages/${BRANCH}
rsync --delete --exclude-from '.gitignore' --exclude-from '.packwizignore' --exclude '.*' -av . ./pages/${BRANCH}
ln -srft ./pages/ ./pages/${BRANCH}/*

GIT_PREFIX="-C pages/"
git ${GIT_PREFIX} add -A

export GIT_{COMMITTER,AUTHOR}_EMAIL="github-actions@gensokyo.zone"
export GIT_{COMMITTER,AUTHOR}_NAME="GitHub Actions"

git ${GIT_PREFIX} commit -m "Synchronize from ${BRANCH}/${REVISION}"
git ${GIT_PREFIX} push origin HEAD:pages