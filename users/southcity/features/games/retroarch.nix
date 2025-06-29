{ pkgs, ... }:
{
  home.packages = [
    (pkgs.retroarch.withCores (cores: [
      cores.desmume
    ]))
  ];
}
