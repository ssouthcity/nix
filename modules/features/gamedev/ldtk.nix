{
  flake.homeModules.gamedev =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.ldtk
      ];
    };
}
