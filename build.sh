#!/usr/bin/env bash
set -xe

TARGET_DIR=${TARGET_DIR:-"$HOME/public_html"}

if ! command -v mkdocs > /dev/null; then
  pip3 install -r requirements.txt --user
fi

mkdocs build -d $TARGET_DIR

set +xe
