#!/usr/bin/env bash

if [ ! -f "$PWD/.venv/bin/mkdocs" ]; then
  "$PWD/.venv/bin/pip3" install -r requirements.txt
fi

"$PWD/.venv/bin/mkdocs" serve