#!/usr/bin/env bash
set -ex

GIT_ROOT=$(git rev-parse --show-toplevel)
SOURCE_DIR="${GIT_ROOT}/markdown"
TARGET_DIR="${GIT_ROOT}/public"

if [[ $SKIP_BUILD == "" ]]; then
  if [[ $FF_LABS_ZENSICAL_BUILD != "" ]]; then
    pipenv run next-build
  else
    pipenv run build
  fi
else
  echo "Skipping build step"
fi

cp "$TARGET_DIR/assets/images/favicon.png" "$TARGET_DIR/favicon.ico" -v
cp "$SOURCE_DIR/.well-known" "$TARGET_DIR/" -rv

unset FF_LABS_ZENSICAL_BUILD
