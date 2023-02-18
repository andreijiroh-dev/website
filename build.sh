#!/usr/bin/env bash
set -xe

TARGET_DIR=${TARGET_DIR:-"$HOME/public_html"}
FF_OFFLINE_MKDOCS_PLUGIN=${FF_OFFLINE_MKDOCS_PLUGIN:-"false"}

pip3 install -r requirements.txt --user
mkdocs build -d $TARGET_DIR

set +xe
