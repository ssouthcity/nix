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
    inputs.nixvim.homeModules.default
    inputs.stylix.homeModules.stylix

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
        "databricks-cli"
      ];

    nixpkgs.overlays = [
      pinnedPackageVersionsOverlay
    ];

    programs.git.settings = {
      user.name = lib.mkForce "Stian Sørby";
      user.email = lib.mkForce "stian.sorby@norges-bank.no";
      credential = {
        helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        useHttpPath = true;
      };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "wslview";
    };

    programs.uv.enable = true;

    home.packages = [
      inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.terraform-refplace
      pkgs.terraform
      pkgs.azure-cli

      # data-dbw
      pkgs.cargo
      pkgs.rustc
      pkgs.gcc
      pkgs.git-cliff
      pkgs.lychee
      pkgs.databricks-cli
    ];

    home.sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
