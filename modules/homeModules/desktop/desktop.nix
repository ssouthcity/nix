{ self, ... }:
{
  flake.homeModules.desktop = {
    imports = with self.homeModules; [
      niri
      noctalia
    ];
  };
}
