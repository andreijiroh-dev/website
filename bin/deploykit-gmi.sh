#!/bin/env bash
set -xe

SOURCEHUT_USERNAME=${SOURCEHUT_PAGES_SUBDOMAIN:-"ajhalili2006"}
GEMINI_CUSTOM_DOMAIN=${GEMINI_CUSTOM_DOMAIN:-"gemini.andreijiroh.eu.org"}

if [[ $SOURCEHUT_PAGES_TOKEN == "" ]]; then
  echo "missing SOURCEHUT_PAGES_TOKEN variable"
  exit 1
fi

mkdir "gmi/api"
git rev-parse HEAD > "gmi/api/commit"
tar -C gmi -cvz . -f site.tar.gz

curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
    -Fcontent=@site.tar.gz \
    -Fprotocol=GEMINI \
    "https://pages.sr.ht/publish/${SOURCEHUT_USERNAME}.srht.site"
curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
    -Fcontent=@site.tar.gz \
    -Fprotocol=GEMINI \
    "https://pages.sr.ht/publish/${GEMINI_CUSTOM_DOMAIN}"