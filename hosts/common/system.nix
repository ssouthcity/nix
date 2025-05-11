{
  system.autoUpgrade = {
    enable = true;
    flake = "github:ssouthcity/nix";
    dates = "daily";
    randomizedDelaySec = "1h";
  };
}
