{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  pinnedPackageVersionsOverlay = _final: _prev: {
    terraform = pkgs.mkTerraform {
      version = "1.12.0";
      hash = "sha256-+EjsKl13kx3uJ50TrZIJLrvf4RBWDJsp1PD1dwtP6XA=";
      vendorHash = "sha256-zWNLIurNP5e/AWr84kQCb2+gZIn6EAsuvr0ZnfSq7Zw=";
    };
  };
in
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix

    ./features/appearance
    ./features/cli
  ];

  config = {
    home.username = "southcity";
    home.homeDirectory = "/home/southcity";

    home.stateVersion = "23.11";

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "terraform"
      ];

    nixpkgs.overlays = [
      pinnedPackageVersionsOverlay
    ];

    programs.git = {
      userName = lib.mkForce "Stian Sørby";
      userEmail = lib.mkForce "stian.sorby@norges-bank.no";
      extraConfig.credential = {
        helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        useHttpPath = true;
      };
    };

    home.packages = [
      pkgs.azure-cli
      pkgs.terraform

      inputs.self.packages.${pkgs.system}.terraform-refplace
    ];
  };
}
