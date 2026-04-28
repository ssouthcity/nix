{ inputs, self, ... }:
{
  flake.homeConfigurations."southcity" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with self.homeModules; [
      {
        # temp fix for https://github.com/NixOS/nixpkgs/issues/514113
        nixpkgs.overlays = [
          (_final: prev: {
            openldap = prev.openldap.overrideAttrs (_: {
              doCheck = false;
            });
          })
        ];
      }

      personalConfiguration

      ai
      base
      browser
      cli
      desktop
      gamedev
      gaming
      nixvim
      social
      streaming
      stylix
      terminal
    ];
  };

  flake.homeConfigurations."southcity@nb-wsl" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with self.homeModules; [
      workConfiguration

      ai
      base
      cli
      nixvim
      stylix
      work
    ];
  };

  flake.homeModules.personalConfiguration = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";
  };

  flake.homeModules.workConfiguration = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.sessionVariables.BROWSER = "wslview";

    home.stateVersion = "23.11";
  };
}
