{ inputs, ... }:
{
  flake-file.inputs = {
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.homeModules.nixvim = {
    imports = [
      inputs.nixvim.homeModules.default
    ];

    programs.nixvim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      defaultEditor = true;
    };
  };
}
