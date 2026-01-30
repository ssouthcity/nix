{
  flake.homeModules.cli = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
