{
  flake.homeModules.terminal = {
    programs.ghostty = {
      enable = true;
      settings = {
        window-padding-x = 8;
        window-padding-y = 8;
      };
    };

    home.sessionVariables.TERM = "ghostty";
  };
}
