{
  imports = [
    ./i18n.nix
    ./nix.nix
    ./system.nix
    ./time.nix
    ./virtualisation.nix
  ];

  programs.dconf.enable = true;
}
