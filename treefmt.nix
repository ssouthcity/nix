{ ... }:
{
  projectRootFile = "flake.nix";

  # github actions
  programs.actionlint.enable = true;

  # nix code
  programs.deadnix.enable = true;
  programs.nixfmt.enable = true;
}
