FROM squidfunk/mkdocs-material

# https://squidfunk.github.io/mkdocs-material/setup/setting-up-social-cards/#linux but for Alpine
RUN apk add \
     cairo-dev \
     freetype-dev \
     libffi-dev \
     jpeg-dev \
     libpng-dev \
     zlib-dev
RUN pip3 install \
      mkdocs-git-revision-date-localized-plugin \
      pillow \
      cairosvg