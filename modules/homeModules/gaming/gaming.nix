{ self, ... }:
{
  flake.homeModules.gaming = {
    imports = with self.homeModules; [
      minecraft
      retroarch
    ];
  };
}
