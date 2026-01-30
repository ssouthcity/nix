{
  flake.homeModules.work =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [
        "databricks-cli"
      ];

      home.packages = [
        pkgs.cargo
        pkgs.databricks-cli
        pkgs.gcc
        pkgs.git-cliff
        pkgs.lychee
        pkgs.rustc
      ];

      programs.uv.enable = true;

      # append uv tools to path
      home.sessionPath = [
        "$HOME/.local/bin"
      ];
    };
}
