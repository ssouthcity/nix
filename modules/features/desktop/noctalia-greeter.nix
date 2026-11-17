{ inputs, ... }:
{
  flake-file.inputs = {
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    noctalia-greeter.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.desktop = {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];

    services.displayManager.noctalia-greeter = {
      enable = true;
    };
  };
}
