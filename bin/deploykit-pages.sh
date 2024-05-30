#!/usr/bin/env bash
set -ea
if [[ $DEBUG != "" ]]; then
  set -x
fi

## source vars from .env first ##
_root_directory_git=$(git rev-parse --show-toplevel)
# shellcheck file=/dev/null
if [[ -f "$_root_directory_git/.env" ]]; then
  source "$_root_directory_git/.env"
fi

_branch_name_git=$(git rev-parse --abbrev-ref HEAD)
_commit_sha=$(git rev-parse HEAD)
_commit_sha_short=$(git rev-parse --short HEAD)

warn() {
    echo "warning: $*"
}

error() {
    echo "error: $*"
}

info() {
  echo "info: $*"
}

if [[ $_branch_name_git == "main" ]] || [[ $_branch_name_git == "HEAD" ]]; then
  export DEPLOY_COMMAND="npx wrangler pages deploy ${_root_directory_git}/public --project-name ${CF_PAGES_PROJECT_NAME} --branch main --commit-hash ${_commit_sha}"
elif [[ $CI_PIPELINE_SOURCE == "merge_request" ]]; then
  export DEPLOY_COMMAND="npx wrangler pages deploy ${_root_directory_git}/public --project-name ${CF_PAGES_PROJECT_NAME} --branch patch-$CI_MERGE_REQUEST_ID --commit-hash ${_commit_sha}"
fi

if ! git diff-index --quiet HEAD -- && [[ $FF_DIRTY_DEPLOY != "true" ]]; then
   error Possible dirty working directory, aborting for safety reasons...
   info To deploy while still dirty, set FF_DIRTY_DEPLOY=true on next invocation.
   exit 1
fi

if [[ ! -d "$_root_directory_git/public" ]]; then
  bash "$_root_directory_git/bin/build.sh"
  cp markdown/.well-known public/ -rv
fi

if [[ $FF_DIRTY_DEPLOY == "true" ]]; then
  $DEPLOY_COMMAND --commit-dirty=true
else
  DEFAULT_COMMAND="npx wrangler pages publish ${_root_directory_git}/public --project-name ${CF_PAGES_PROJECT_NAME} --branch main"
  ${DEPLOY_COMMAND:-$DEFAULT_COMMAND}
fi
unset DEPLOY_COMMAND

# temporarily disabled
#if [[ $_branch_name_git == "main" ]] || [[ $_branch_name_git == "HEAD" ]]; then
#  tar -C public -cvz . -f site-build.tar.gz
#  curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
#    -Fcontent=@site-build.tar.gz \
#    "https://pages.sr.ht/publish/ajhalili2006.srht.site"
#fi

if [[ $DEBUG != "" ]]; then
  set +x
fi
set +a
