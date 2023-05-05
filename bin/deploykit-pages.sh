#!/usr/bin/env bash
set -ea
if [[ $DEBUG != "" ]]; then
  set -x
fi

## source vars from .env first ##
_root_directory_git=$(git rev-parse --show-toplevel)
# shellcheck file=/dev/null
source "$_root_directory_git/.env"

_branch_name_git=$(git rev-parse --abbrev-ref HEAD)
_commit_sha=$(git rev-parse HEAD)
_commit_sha_short=$(git rev-parse --short HEAD)
_command_prefix="npx wrangler pages publish $_root_directory_git/public --project-name $CF_PAGES_PROJECT_NAME --branch $_branch_name_git --commit-hash $_commit_sha"

warn() {
    echo "warning: $*"
}

error() {
    echo "error: $*"
}

info() {
  echo "info: $*"
}

if [[ $_branch_name_git == "main" ]]; then
  DEPLOY_COMMAND="$_command_prefix --env production"
elif [[ $CI_PIPELINE_SOURCE == "merge_request" ]]; then
  DEPLOY_COMMAND="$_command_prefix --env pr-#CI_MERGE_REQUEST_ID"
fi

if ! git diff-index --quiet HEAD -- && [[ $FF_DIRTY_DEPLOY != "true" ]]; then
   error Possible dirty working directory, aborting for safety reasons...
   info To deploy while still dirty, set FF_DIRTY_DEPLOY=true on next invocation.
   exit 1
fi

if [[ ! -d "$_root_directory_git/public" ]]; then
  bash "$_root_directory_git/bin/build.sh"
fi

if [[ $FF_DIRTY_DEPLOY == "true" ]]; then
  $DEPLOY_COMMAND --commit-dirty
else
  ${DEPLOY_COMMAND:-"$_command_prefix"}
fi

if [[ $DEBUG != "" ]]; then
  set +x
fi
set +a
