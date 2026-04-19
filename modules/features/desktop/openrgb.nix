{
  flake.nixosModules.desktop = {
    services.hardware.openrgb = {
      enable = true;
      server.port = 6742;
    };

    networking.firewall.allowedTCPPorts = [ 6742 ];
  };
}
