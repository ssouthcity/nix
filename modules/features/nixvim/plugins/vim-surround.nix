{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.vim-surround = {
      enable = true;
    };
  };
}
