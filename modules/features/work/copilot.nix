{
  flake.homeModules.work =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [
        "copilot.vim"
        "github-copilot-cli"
      ];

      home.packages = [ pkgs.github-copilot-cli ];

      programs.nixvim.plugins.copilot-vim = {
        enable = true;
        package = pkgs.vimPlugins.copilot-vim;
      };
    };
}
