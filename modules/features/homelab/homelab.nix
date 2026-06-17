{
  flake.homeModules.homelab =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.age
        pkgs.cosign
        pkgs.fluxcd
        pkgs.fluxcd-operator
        pkgs.fluxcd-operator-mcp
        pkgs.k9s
        pkgs.kind
        pkgs.kubectl
        pkgs.kubernetes-helm
        pkgs.oras
        pkgs.sops
        pkgs.talosctl

        (pkgs.buildGoModule {
          pname = "topf";
          version = "0.3.0";
          src = pkgs.fetchFromGitHub {
            owner = "postfinance";
            repo = "topf";
            rev = "v0.3.0";
            sha256 = "sha256-X9KWQaRbICr22wcxP0oaCqULNzhVnn840IHZdZ9v+XA=";
          };
          vendorHash = "sha256-UL/iVqVMN9JL85ylLFpEJ+yit60LAaghRCTNEx8q2MQ=";
        })
      ];
    };
}
