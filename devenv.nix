{ pkgs, ... }: {

  packages = with pkgs; [
    gitFull
    pipenv

    # doppler
    doppler

    # required for social cards in mkdocs-material
    cairo
    freetype
    libffi
    libjpeg
    zlib
    pngquant
  ];

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
