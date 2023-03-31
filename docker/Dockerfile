FROM python:alpine3.17

# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards/#linux but for Alpine
RUN apk add --no-cache \
     cairo-dev \
     freetype-dev \
     libffi-dev \
     jpeg-dev \
     libpng-dev \
     zlib-dev \
     bash \
     coreutils
RUN /usr/local/bin/pip3 install \
      mkdocs-material \ 
      mkdocs-redirects \
      mkdocs-git-revision-date-localized-plugin \
      pillow \
      cairosvg

ENTRYPOINT [ "mkdocs" ]
CMD [ "serve" ]