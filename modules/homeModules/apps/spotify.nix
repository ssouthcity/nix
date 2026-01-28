{
  flake.homeModules.spotify =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.spotify
      ];
    };
}
