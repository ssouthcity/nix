{
  flake.homeModules.minecraft =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.prismlauncher ];
    };
}
