{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeModules.stylix

    ./features/appearance
    ./features/apps
    ./features/cli
    ./features/games
    ./features/hyprland
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
  };
}
