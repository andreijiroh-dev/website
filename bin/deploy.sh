#!/usr/bin/env bash
set -ea
if [[ $DEBUG != "" ]]; then
  set -x
fi

_root_directory_git=$(git rev-parse --show-toplevel)

warn() {
    echo "warning: $*"
}

error() {
    echo "error: $*"
}

info() {
  echo "info: $*"
}

if [[ $CI == "true" ]] && [[ $CI_PIPELINE_SOURCE == "push" || $CI_PIPELINE_SOURCE == "web" ]] && [[ $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH ]]; then
  npx wrangler pages publish ${_root_directory_git}/public --project-name ${CF_PAGES_PROJECT_NAME:-"ajhalili2006"} --branch main
  scp -i "$PWD/.secretskit/passwordless" -o "StrictHostKeyChecking=no" -rv public ajhalili@iapetus.uberspace.de:html
fi