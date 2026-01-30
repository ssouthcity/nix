{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.gitsigns = {
      enable = true;
    };
  };
}
