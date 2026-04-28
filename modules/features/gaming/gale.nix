{
  flake.homeModules.gaming =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.gale ];
    };
}
