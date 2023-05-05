#!/usr/bin/env bash

if [ ! -f "$PWD/.venv/bin/mkdocs" ] || [ $FF_DEPS_REFRESH != "true" ]; then
  "$PWD/.venv/bin/pip3" install -r requirements.txt
fi

# enable embeding commit info in previews
FF_ENABLE_COMMIT_DATA=true "$PWD/.venv/bin/mkdocs" serve