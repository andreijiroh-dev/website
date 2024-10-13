#!/usr/bin/env bash
set -ex

SOURCE_DIR="${PWD}/markdown"
TARGET_DIR="${PWD}/public"
pipenv run build
cp "$TARGET_DIR/assets/images/favicon.png" "$TARGET_DIR/favicon.ico" -v
cp "$SOURCE_DIR/.well-known" "$TARGET_DIR/" -rv
