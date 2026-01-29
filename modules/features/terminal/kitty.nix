{
  flake.homeModules.terminal = {
    programs.kitty = {
      enable = true;
      settings = {
        window_padding_width = 8;
      };
    };

    home.sessionVariables.TERM = "kitty";
  };
}
