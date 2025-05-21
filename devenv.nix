{ pkgs, ... }: {

  packages = with pkgs; [
    gitFull
    pipenv
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
  '';
}
