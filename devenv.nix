{ pkgs, lib, ... }: {

  packages = with pkgs; [
    gitFull
    pipenv

    # doppler
    doppler

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
    pkgs.cairo
    pkgs.pango
    pkgs.gdk-pixbuf
    pkgs.librsvg
    pkgs.fontconfig
    pkgs.freetype
    pkgs.zlib
  ];

  # Optional, but silences CI warning and ensures predictable locale
  env.LANG = "en_US.UTF-8";

  languages = {
    javascript = {
      enable = true;
      package = pkgs.nodejs_22;
    };
    python = {
      enable = true;
      version = "3.13.3";
    };
  };

  enterShell = ''
    pipenv install
    npm install
  '';

  tasks = {
    "site:build".exec = "pipenv run build";
    "site:deploy".exec = "npm run deploy";
  };
}
