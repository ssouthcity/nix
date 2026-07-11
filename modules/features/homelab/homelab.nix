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
          version = "0.4.2";
          src = pkgs.fetchFromGitHub {
            owner = "postfinance";
            repo = "topf";
            rev = "v0.4.2";
            sha256 = "sha256-W1IES57n8NTcnt9D5iTkrAxnZf4oaz4vm6UBTM96nrc=";
          };
          vendorHash = "sha256-YGDMWx8jLwLcdjIIh82wL2k1yhWo1+GEW0aq47PZbDI=";
          nativeCheckInputs = [
            pkgs.age
            pkgs.sops
            pkgs.vals
          ];
        })
      ];
    };
}
