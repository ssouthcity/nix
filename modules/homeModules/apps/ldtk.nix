{
  flake.homeModules.ldtk =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.ldtk
      ];
    };
}
