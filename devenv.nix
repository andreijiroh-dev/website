{ pkgs, ... }: {

  packages = with pkgs; [
    gitFull
    pipenv
    python313 # this is a hack to use nixpkgs one instead of compiling from source
  ];

  enterShell = ''
    pipenv install
  '';
}
