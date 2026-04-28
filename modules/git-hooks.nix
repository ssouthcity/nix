{ inputs, ... }:
{
  flake-file.inputs = {
    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  imports = [
    inputs.git-hooks.flakeModule
  ];

  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit.settings.hooks = {
        nix-fmt = {
          enable = true;
          name = "nix fmt";
          entry = "nix fmt";
          language = "system";
          pass_filenames = false;
        };

        write-flake = {
          enable = true;
          name = "write-flake";
          entry = "nix run .#write-flake";
          language = "system";
          pass_filenames = false;
        };
      };

      devShells.default = pkgs.mkShell {
        shellHook = config.pre-commit.shellHook;
        packages = config.pre-commit.settings.enabledPackages;
      };
    };
}
