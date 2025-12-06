#!/usr/bin/env bash
set -ea
if [[ $DEBUG != "" ]]; then
  set -x
fi

_root_directory_git=$(git rev-parse --show-toplevel)
_git_current_branch=$(git rev-parse --abbrev-ref HEAD)
CI_COMMIT_BRANCH=${CI_COMMIT_BRANCH:-$_git_current_branch}
CI_DEFAULT_BRANCH="main"

warn() {
    echo "warning: $*"
}

error() {
    echo "error: $*"
}

info() {
  echo "info: $*"
}

if [[ $CI == "true" ]]; then
  info "Deploying to Cloudflare Workers"
  if [[ $CI_PIPELINE_SOURCE == "push" || $CI_PIPELINE_SOURCE == "web" ]] && [[ $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH ]]; then
    npx wrangler deploy
  fi
fi