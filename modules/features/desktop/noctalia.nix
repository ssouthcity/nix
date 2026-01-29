{ inputs, ... }:
{
  flake.homeModules.desktop = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
