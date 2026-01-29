{ self, ... }:
{
  flake.homeModules.work =
    { pkgs, ... }:
    let
      pinnedTerraformOverlay = _final: _prev: {
        terraform = pkgs.mkTerraform {
          version = "1.12.0";
          hash = "sha256-+EjsKl13kx3uJ50TrZIJLrvf4RBWDJsp1PD1dwtP6XA=";
          vendorHash = "sha256-zWNLIurNP5e/AWr84kQCb2+gZIn6EAsuvr0ZnfSq7Zw=";
        };
      };
    in
    {
      allowedUnfreePackages = [ "terraform" ];

      nixpkgs.overlays = [ pinnedTerraformOverlay ];

      home.packages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.terraform-refplace
        pkgs.terraform
        pkgs.azure-cli
      ];
    };
}
