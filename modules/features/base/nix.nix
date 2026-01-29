{ inputs, ... }:
{
  flake.nixosModules.base = {
    # Garbage collect NixOS generations
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
      persistent = true;
      randomizedDelaySec = "1h";
    };

    # Optimize the Nix store by hardlinking packages
    nix.optimise = {
      automatic = true;
      dates = [ "daily" ];
      persistent = true;
      randomizedDelaySec = "1h";
    };

    # Link named references to nixpkgs to the upstream input
    nix.registry = {
      nixpkgs.flake = inputs.nixpkgs;
    };

    # Enable Nix flakes
    nix.settings.experimental-features = [
      "flakes"
      "nix-command"
    ];

    # Trusted substituters
    nix.settings.trusted-substituters = [
      "https://devenv.cachix.org"
    ];

    nix.settings.trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];

    nix.settings.trusted-users = [
      "@wheel"
    ];
  };
}
