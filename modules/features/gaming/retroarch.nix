{
  flake.homeModules.gaming =
    { pkgs, ... }:
    {
      home.packages = [
        (pkgs.retroarch.withCores (cores: [
          cores.desmume
        ]))
      ];
    };
}
