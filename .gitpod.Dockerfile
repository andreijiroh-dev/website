# syntax=docker/dockerfile:1
FROM gitpod/workspace-full:latest as workspace

WORKDIR /tmp
RUN git clone https://git.sr.ht/~sircmpwn/scdoc && cd scdoc \
    && make && sudo cp scdoc /usr/local/bin/scdoc && cd .. \
    && git clone https://git.sr.ht/~emersion/hut && cd hut \
    && make PREFIX=/home/gitpod/.local && sudo cp ./hut /usr/local/bin/hut \
    && sudo rm -rv /tmp/*

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
WORKDIR /home/gitpod
RUN brew update && brew install \
    && brew install hadolint shellcheck \
    && npm i -g wrangler \
    && git -C ~/.pyenv pull origin master
