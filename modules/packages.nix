{
  flake.overlays.default = _final: prev: {
    terraform-refplace = prev.callPackage ../packages/terraform-refplace.nix { };
  };

  perSystem =
    { pkgs, ... }:
    {
      packages = {
        terraform-refplace = pkgs.callPackage ../packages/terraform-refplace.nix { };
      };
    };
}
