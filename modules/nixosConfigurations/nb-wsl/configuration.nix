{ inputs, self, ... }:
{
  flake.nixosConfigurations.nb-wsl = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      nbConfiguration

      autoUpgrade
      docker
      i18n
      nix
      time
    ];
  };

  flake.nixosModules.nbConfiguration =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixos-wsl.nixosModules.default
      ];

      wsl.enable = true;
      wsl.defaultUser = "southcity";

      networking.hostName = "nb-wsl";

      environment.systemPackages = [
        pkgs.home-manager
        pkgs.wslu
      ];

      programs.nix-ld = {
        enable = true;
        libraries = [ pkgs.icu ];
      };

      system.stateVersion = "23.11";
    };
}
