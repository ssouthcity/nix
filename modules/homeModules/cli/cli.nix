{ self, ... }:
{
  flake.homeModules.cli = {
    imports = with self.homeModules; [
      bash
      devenv
      direnv
      eza
      fzf
      git
      jq
      news
      nixvim
      starship
      tmux
      zoxide
    ];
  };
}
