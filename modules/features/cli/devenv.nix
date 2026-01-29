{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.devenv
      ];
    };
}
