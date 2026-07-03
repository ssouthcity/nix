{
  flake.nixosModules.desktop = {
    programs.thunar = {
      enable = true;
    };
  };
}
