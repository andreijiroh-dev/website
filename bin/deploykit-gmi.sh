#!/usr/bin/env bash

PRIVATE_SSH_KEY=${PRIVATE_SSH_KEY:-"/run/secrets/passwordless"}
SOURCEHUT_USERNAME=${SOURCEHUT_PAGES_SUBDOMAIN:-"ajhalili2006"}
SOURCEHUT_PAGES_TOKEN=${SOURCEHUT_PAGES_TOKEN}
GEMINI_CUSTOM_DOMAIN=${GEMINI_CUSTOM_DOMAIN:-"gemini.andreijiroh.eu.org"}

if [[ $SOURCEHUT_PAGES_TOKEN == "" ]]; then
  echo "missing SOURCEHUT_PAGES_TOKEN variable"
  exit 1
fi

mkdir "gmi/api"
git rev-parse HEAD > "gmi/api/commit"
tar -C gmi -cvz . -f gemini-site.tar.gz

curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
    -Fcontent=@gemini-site.tar.gz \
    -Fprotocol=GEMINI \
    "https://pages.sr.ht/publish/${SOURCEHUT_USERNAME}.srht.site"
curl --oauth2-bearer "$SOURCEHUT_PAGES_TOKEN" \
    -Fcontent=@gemini-site.tar.gz \
    -Fprotocol=GEMINI \
    "https://pages.sr.ht/publish/${GEMINI_CUSTOM_DOMAIN}"

rsync -rP -e "ssh -i ${PRIVATE_SSH_KEY} -o StrictHostKeyChecking=no" gmi/ ajhalili2006@p.projectsegfau.lt:/home/ajhalili2006/public_gemini
rsync -rP -e "ssh -i ${PRIVATE_SSH_KEY} -o StrictHostKeyChecking=no" gmi/ ajhalili2006@s1.dimension.sh:/home/ajhalili2006/public_gemini
