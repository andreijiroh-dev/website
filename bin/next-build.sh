#!/usr/bin/env bash

export FF_LABS_ZENSICAL_BUILD=true
GIT_ROOT=$FF_LABS_ZENSICAL_BUILD
exec "$GIT_ROOT/bin/build.sh"
