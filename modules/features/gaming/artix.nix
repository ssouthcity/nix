{
  flake.homeModules.gaming =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [ "artix-games-launcher" ];

      home.packages = [ pkgs.artix-games-launcher ];
    };
}
