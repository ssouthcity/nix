{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.default
    inputs.stylix.homeModules.stylix

    ./features/appearance
    ./features/apps
    ./features/cli
    ./features/desktop
    ./features/games
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "aseprite"
        "discord"
        "spotify"
      ];

    home.sessionVariables = {
      BROWSER = "firefox";
      EDITOR = "nvim";
      TERM = "kitty";
    };
  };
}
