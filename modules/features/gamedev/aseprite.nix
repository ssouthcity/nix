{
  flake.homeModules.gamedev =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [ "aseprite" ];

      home.packages = [ pkgs.aseprite ];
    };
}
