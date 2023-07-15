#!/bin/env bash

if [[ $SOURCEHUT_PAGES_TOKEN == "" ]]; then
  echo "missing SOURCEHUT_PAGES_TOKEN variable"
  exit 1
fi

curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
    -Fcontent=@site.tar.gz \
    -Fprotocol=GEMINI \
    https://pages.sr.ht/publish/username.srht.site