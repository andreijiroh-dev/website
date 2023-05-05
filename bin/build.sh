#!/usr/bin/env bash
set -e
if [[ $DEBUG != "" ]]; then
  set -x
fi

_root_directory_git=$(git rev-parse --show-toplevel)
TARGET_DIR=${TARGET_DIR:-"$PWD/public"}

## source vars from .env first ##
export "$(xargs < "$_root_directory_git/.env")"

warn() {
    echo "warning: $*"
}

error() {
    echo "error: $*"
}

if [[ ! -d .venv ]]; then
  python3 -m venv .venv
  "$_root_directory_git/.venv/bin/pip3" install -r requirements.txt --upgrade
fi

"$_root_directory_git/.venv/bin/mkdocs" build \
  -d "$TARGET_DIR" \
  --use-directory-urls \
  --verbose