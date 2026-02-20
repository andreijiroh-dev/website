# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = with pkgs; [
    gitFull
    python314
    pipenv
    glab
    gh
    cairo
    freetype
    libffi
    libjpeg
    libpng
    zlib
    pngquant
  ];

  # Sets environment variables in the workspace
  env = {
    FF_ENABLE_COMMIT_DATA = "true";
    FF_GENERATE_SOCIAL_CARDS= "true";
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
      "DavidAnson.vscode-markdownlint"
      "redhat.vscode-yaml"
      "GitLab.gitlab-workflow"
      "vivaxy.vscode-conventional-commits"
      "eamodio.gitlens"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["pipenv" "run" "dev" "-a" "0.0.0.0:$PORT"];
          manager = "web";
          env = {
            # Environment variables to set for your server
            PORT = "$PORT";
          };
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        pipenv-install = "pipenv install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
        #preview = "pipenv run dev";
      };
    };
  };
}
