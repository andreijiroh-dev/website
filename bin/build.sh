#!/usr/bin/env bash
set -xe

TARGET_DIR=${TARGET_DIR:-"$PWD/public"}
FF_OFFLINE_MKDOCS_PLUGIN=${FF_OFFLINE_MKDOCS_PLUGIN:-"false"}
FF_ENABLE_COMMIT_DATA=${FF_ENABLE_COMMIT_DATA:-"true"}
FF_GENERATE_SOCIAL_CARDS=${FF_GENERATE_SOCIAL_CARDS:-"true"}

if [[ ! -d "$PWD/.venv" && $SKIP_VENV_SETUP == "" ]]; then
  python3 -m venv $PWD/.venv
  $PWD/.venv/bin/pip3 install -r requirements.txt --upgrade
  $PWD/.venv/bin/mkdocs build -d $TARGET_DIR
else
  pip3 install -r requirements.txt --upgrade
  mkdocs build -d $TARGET_DIR
fi

mkdir "$TARGET_DIR/api"
git rev-parse HEAD > "$TARGET_DIR/api/commit"

set +xe
