{ ... }:
{
  projectRootFile = "flake.nix";

  # github actions
  programs.actionlint.enable = true;

  # nix code
  programs.nixfmt.enable = true;
}
