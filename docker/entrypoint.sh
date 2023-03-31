#!/usr/bin/env bash

if [[ $DEBUG != "" ]]; then
  set -x
fi

if [[ $1 = "serve" ]] || [[ $1 == "build" ]] | [[ $1 == "gh-deploy" ]] || [[ $1 == "new" ]]; then
  exec mkdocs $@
else
  $@
fi
