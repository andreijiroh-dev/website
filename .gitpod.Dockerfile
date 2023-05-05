# syntax=docker/dockerfile:1
FROM gitpod/workspace-full

# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards/#linux
RUN sudo install-packages \
      libcairo2-dev \
      libfreetype6-dev \
      libffi-dev \
      libjpeg-dev \
      libpng-dev \
      libz-dev

# https://docs.docker.com/build/install-buildx/
COPY --from=docker/buildx-bin:latest /buildx /usr/libexec/docker/cli-plugins/docker-buildx

# brew maintenance + install ShellCheck and Hadolint
RUN brew update && brew install hadolint shellcheck