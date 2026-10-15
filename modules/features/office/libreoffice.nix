{
  flake.homeModules.office = { pkgs, ... }: {
    home.packages = [
      pkgs.libreoffice
    ];
  };
}
