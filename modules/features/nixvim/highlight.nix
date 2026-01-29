let
  transparent = {
    bg = "none";
    ctermbg = "none";
  };
in
{
  flake.homeModules.nixvim = {
    programs.nixvim.highlight = {
      Normal = transparent;
      NonText = transparent;
      SignColumn = transparent;
      LineNr = transparent;
      StatusLine = transparent;
    };
  };
}
