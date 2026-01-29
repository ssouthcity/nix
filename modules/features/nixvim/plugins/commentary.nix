{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.commentary = {
      enable = true;
    };
  };
}
