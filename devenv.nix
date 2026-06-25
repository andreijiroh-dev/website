{ pkgs, lib, ... }: {

  name = "site";

  packages = with pkgs; [
    gitFull
    pipenv

    # developer tooling
    doppler
    # see https://devenv.sh/languages/python/#uv
    # uv

    # required for social cards in mkdocs-material / CairoSVG
    cairo
    pango
    gdk-pixbuf
    librsvg
    fontconfig
    freetype
    libffi
    libjpeg
    zlib
    pngquant
  ];

  # Ensure dynamic linker can find shared libs for Python ctypes consumers like CairoSVG
  env.LD_LIBRARY_PATH = lib.makeLibraryPath [
    # Required by mkdocs-material and/or zensical for social cards
    pkgs.cairo
    pkgs.pango
    pkgs.gdk-pixbuf
    pkgs.librsvg
    pkgs.fontconfig
    pkgs.freetype
    pkgs.zlib

    # Required by uv cli: https://nixos.org/manual/nixpkgs/unstable/#sec-uv
    pkgs.openssl
    pkgs.curl
  ];

  # Disable python downloads for uv cli to avoid incompatibility related issues
  env.UV_PYTHON_DOWNLOADS = "never";

  # Optional, but silences CI warning and ensures predictable locale
  env.LANG = "en_US.UTF-8";

  languages = {
    javascript = {
      enable = true;
      package = pkgs.nodejs_24;
      npm = {
        enable = true;
        install.enable = true;
      };
    };
    python = {
      enable = true;
      package = pkgs.python314;
      venv.enable = true;
      # see https://devenv.sh/languages/python/#uv
      uv = {
        enable = true;
        sync.enable = true;
      };
    };
  };

  #enterShell = ''
  #  pipenv install
  #  npm install
  #'';

  tasks = {
    "site:build".exec = "pipenv run build";
    "site:deploy".exec = "npm run deploy";
  };
}
