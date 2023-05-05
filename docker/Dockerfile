# Since hadolint isn't in the package repos for Alpineyet, we'll copying from the offical
# Docker image instead.
FROM ghcr.io/hadolint/hadolint:latest-alpine AS hadolint-binary

# Since we're building against edge at risk
FROM alpine:edge AS buildkit

COPY --stage=hadolint-binary /bin/hadolint /usr/bin/hadolint

# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards/#linux but for Alpine
# hadolint ignore=DL3018,DL3013
RUN apk add --no-cache \
     cairo-dev \
     freetype-dev \
     libffi-dev \
     jpeg-dev \
     libpng-dev \
     zlib-dev \
     bash \
     coreutils \
     python3 \
     py3-pip \
     py3-wheel \
     shellcheck \
  && pip3 install --no-cache \
      mkdocs-material \ 
      mkdocs-redirects \
      mkdocs-git-revision-date-localized-plugin \
      pillow \
      cairosvg
