#!/usr/bin/env bash
set -xe

TARGET_DIR=${TARGET_DIR:-"$PWD/public"}
FF_OFFLINE_MKDOCS_PLUGIN=${FF_OFFLINE_MKDOCS_PLUGIN:-"false"}
FF_ENABLE_COMMIT_DATA=${FF_ENABLE_COMMIT_DATA:-"true"}
FF_GENERATE_SOCIAL_CARDS=${FF_GENERATE_SOCIAL_CARDS:-"true"}
TARGET_BUILD_CONFIG=${1:-"mkdocs.yml"}

if [[ ! -d "$TARGET_DIR" ]]; then
  mkdir "$TARGET_DIR" -pv
fi

if [[ $SKIP_VENV_SETUP == "" ]] || [[ $CI == "" ]]; then
  pipenv install --ignore-pipfile --deploy --verbose
  pipenv run mkdocs build -d "$TARGET_DIR" -f ${TARGET_BUILD_CONFIG}
else
  pip3 install -r requirements.txt --upgrade --user
  mkdocs build -d "$TARGET_DIR" -f ${TARGET_BUILD_CONFIG}
fi

mkdir "$TARGET_DIR/api"
git rev-parse HEAD > "$TARGET_DIR/api/commit"
cp "$TARGET_DIR/assets/images/favicon.png" "$TARGET_DIR/favicon.ico"
cp markdown/.well-known "$TARGET_DIR/.well-known" -rv
cp markdown/humans.txt "$TARGET_DIR/humans.txt" -v

set +xe
