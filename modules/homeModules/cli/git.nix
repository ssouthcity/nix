{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Stian Sørby";
          email = "51554341+ssouthcity@users.noreply.github.com";
        };
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
        alias = {
          amend = "commit --amend --no-edit";
          force = "push --force-if-includes --force-with-lease";
          noop = "commit --allow-empty -m 'noop'";
          nvm = "!git reset --hard HEAD && git clean -d -f";
        };
      };
    };
  };
}
