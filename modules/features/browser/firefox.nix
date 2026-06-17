{
  flake.nixosModules.browser = {
    programs.firefox.enable = true;
  };

  flake.homeModules.browser = {
    programs.firefox.enable = true;

    # firefox is configured through Mozilla cloud
    # to sync firefox across non-nix devices
    stylix.targets.firefox.enable = false;
  };
}
