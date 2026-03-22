{
  flake.homeModules.gaming =
    { pkgs, ... }:
    {
      programs.lutris = {
        enable = true;
        winePackages = [ pkgs.wineWow64Packages.full pkgs.winetricks ];
      };
    };
}
