{ inputs, self, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.homeConfigurations."southcity@neptr" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with self.homeModules; [
      personalConfiguration

      apps
      cli
      desktop
      gaming
      stylix
    ];
  };

  flake.homeConfigurations."southcity@amo" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with self.homeModules; [
      personalConfiguration

      apps
      cli
      desktop
      gaming
      stylix
    ];
  };

  flake.homeConfigurations."southcity@nb-wsl" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with self.homeModules; [
      workConfiguration

      cli
      stylix
    ];
  };

  flake.homeModules.personalConfiguration =
    { lib, ... }:
    {
      home.username = "southcity";
      home.homeDirectory = "/home/southcity";

      home.stateVersion = "23.11";

      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "aseprite"
          "discord"
          "spotify"
        ];

      home.sessionVariables = {
        BROWSER = "firefox";
        EDITOR = "nvim";
        TERM = "kitty";
      };
    };

  flake.homeModules.workConfiguration =
    {
      pkgs,
      lib,
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
        self.packages.${pkgs.stdenv.hostPlatform.system}.terraform-refplace
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
