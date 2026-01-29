{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.web-devicons = {
      enable = true;
    };
  };
}
