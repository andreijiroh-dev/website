#!/usr/bin/env bash
set -ex

TARGET_DIR="${PWD}/public"
pipenv run build
cp "$TARGET_DIR/assets/images/favicon.png" "$TARGET_DIR/favicon.ico"
