{
  flake.homeModules.nixvim = {
    programs.nixvim.plugins.jupytext = {
      enable = true;
    };
  };
}
