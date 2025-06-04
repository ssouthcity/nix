{ pkgs, ... }:
{
  home.packages = [
    pkgs.discord
  ];

  xdg.autostart.entries = [
    pkgs.discord
  ];
}
