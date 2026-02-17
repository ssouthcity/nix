{
  flake.homeModules.work = {
      programs.mise.enable = true;

      # append uv tools to path
      home.sessionPath = [
        "$HOME/.local/bin"
      ];
    };
}
