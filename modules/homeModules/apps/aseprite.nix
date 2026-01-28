{
  flake.homeModules.aseprite =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.aseprite ];
    };
}
