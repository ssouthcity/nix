{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.tmux-navigator = {
      enable = true;
    };
  };
}
