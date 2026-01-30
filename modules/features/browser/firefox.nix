{
  flake.nixosModules.browser = {
    programs.firefox.enable = true;
  };

  flake.homeModules.browser = {
    programs.firefox.enable = true;

    home.sessionVariables.BROWSER = "firefox";

    # firefox is configured through Mozilla cloud
    # to sync firefox across non-nix devices
    stylix.targets.firefox.enable = false;
  };
}
