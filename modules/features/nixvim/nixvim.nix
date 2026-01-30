{ inputs, ... }:
{
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
