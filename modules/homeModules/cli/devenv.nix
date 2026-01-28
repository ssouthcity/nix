{
  flake.homeModules.devenv =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.devenv
      ];
    };
}
