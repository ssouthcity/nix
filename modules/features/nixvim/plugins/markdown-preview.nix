{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.markdown-preview = {
      enable = true;
    };
  };
}
