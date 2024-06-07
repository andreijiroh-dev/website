# syntax=docker/dockerfile:1
FROM python:3.12-alpine AS buildkit
# Instead of using Alpine base image and then installing Python from pkgs.al.o,
# we'll go with the official images instead.

# Since hadolint isn't in the package repos for Alpine yet, we'll copying from the offical
# Docker image instead.
COPY --from=ghcr.io/hadolint/hadolint:latest-alpine /bin/hadolint /usr/bin/hadolint

# Copy build artifacts from official node image into here
ENV YARN_VERSION 1.22.22
COPY --from=node:20-alpine /opt/yarn-v$YARN_VERSION/bin/ /usr/local/bin/
COPY --from=node:20-alpine /usr/local/bin/node /usr/local/bin/node
COPY --from=node:20-alpine /usr/local/lib/node_modules/ /usr/local/lib/node_modules/

ENV PACKAGES=/usr/local/lib/python3.11/site-packages PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin PYTHONDONTWRITEBYTECODE=1
LABEL org.opencontainers.image.description="GitLab CI image for custom mkdocs-material Docker image, alongside tools @ajhalili2006 use."

# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards/#linux but for Alpine
# Also installs Doppler CLI for accessing secrets securely within CI
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
     shellcheck \
     gcc \
     libffi-dev \
     musl-dev \
     git \
     git-email \
     git-lfs \
     git-fast-import \
     openssh \
     gnupg \
     curl \
     rsync \
  && curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh \
    | sh

# See https://www.jeffgeerling.com/blog/2023/how-solve-error-externally-managed-environment-when-installing-pip3
# for context behind removing the EXTERNALLY-MANAGED file on distribution-built CPython binary releases
RUN pip install --no-cache \
      mkdocs-material \
      mkdocs-git-committers-plugin-2 \
      mkdocs-git-revision-date-localized-plugin \
      mkdocs-minify-plugin \
      mkdocs-redirects \
      mkdocs-rss-plugin \
      pillow \
      cairosvg \
      pipenv \
      pipx \
    && corepack enable

# Trust directory, required for git >= 2.35.2
# Follows the docs for the Docker-based site build setup
RUN git config --global --add safe.directory /docs &&\
    git config --global --add safe.directory /site

# Expose MkDocs development server port
EXPOSE 8000

WORKDIR /docs

#COPY entrypoint.sh /usr/local/bin/entrypoint
CMD [ "mkdocs", "serve", "--dev-addr=0.0.0.0:8000" ]
