{
  flake.homeModules.cli = {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Stian Sørby";
          email = "51554341+ssouthcity@users.noreply.github.com";
        };
      };
    };
  };
}
