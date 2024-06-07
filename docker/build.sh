#!/usr/bin/env bash
set -xe

ROOTDIR=$(git rev-parse --show-toplevel)
CONTEXT=$ROOTDIR/docker
DOCKERFILE=$CONTEXT/Dockerfile
TAG=${IMAGE_TAG:-"quay.io/ajhalili2006/mkdocs-material-build-ci:localdev"}

DOCKER_BUILDKIT=${DOCKER_BUILDKIT:-"1"} \
  docker build \
  -t $TAG \
  -f "$DOCKERFILE" \
  "$CONTEXT"

if [[ $DEPLOY != "" ]]; then
  docker push "$TAG"
fi