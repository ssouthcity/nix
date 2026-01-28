{ self, ... }:
{
  flake.homeModules.apps = {
    imports = with self.homeModules; [
      aseprite
      discord
      firefox
      kitty
      ldtk
      obs-studio
      spotify
      xdg
    ];
  };
}
