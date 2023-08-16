# syntax=docker/dockerfile:1
FROM ghcr.io/hadolint/hadolint:latest-alpine AS hadolint-binary

# Since we're building against edge at risk, it is important to note
# that anything might go wrong.
FROM alpine:edge AS buildkit

# Since hadolint isn't in the package repos for Alpine yet, we'll copying from the offical
# Docker image instead.
COPY --from=hadolint-binary /bin/hadolint /usr/bin/hadolint

ENV PACKAGES=/usr/local/lib/python3.11/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

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
     gcc \
     libffi-dev \
     musl-dev \
     nodejs \
     npm \
     yarn \
     git \
     git-fast-import \
     openssh \
     gnupg \
     curl \
  && curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh \
    | sh
# The "--break-system-packages" is added so I don't need to do requirements.txt workaround,
# although I also consider using pipx if we wanted to.
RUN pip3 install --no-cache-dir \
      --break-system-packages \
      mkdocs-material \ 
      mkdocs-redirects \
      mkdocs-git-revision-date-localized-plugin \
      pillow \
      cairosvg

# Trust directory, required for git >= 2.35.2
# Follows the docs for the Docker-based site build setup
RUN git config --global --add safe.directory /docs &&\
    git config --global --add safe.directory /site

# Expose MkDocs development server port
EXPOSE 8000

WORKDIR /docs

#COPY entrypoint.sh /usr/local/bin/entrypoint
CMD [ "mkdocs", "serve", "--dev-addr=0.0.0.0:8000" ]