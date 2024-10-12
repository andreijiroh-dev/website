#!/usr/bin/env bash
set -e

TARGET_DIR="${PWD}/public"
pipenv run build
cp "$TARGET_DIR/assets/images/favicon.png" "$TARGET_DIR/favicon.ico"
cp markdown/.well-known markdown/humans.txt "$TARGET_DIR/" -rv
