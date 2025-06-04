{ pkgs, ... }:
{
  home.packages = [
    pkgs.spotify
  ];

  xdg.autostart.entries = [
    pkgs.spotify
  ];
}
