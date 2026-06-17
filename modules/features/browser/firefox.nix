{
  flake.nixosModules.browser = {
    programs.firefox.enable = true;
  };

  flake.homeModules.browser = { config, ... }: {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";

      profiles.default = { };
    };

    stylix.targets.firefox.profileNames = [ "default" ];
  };
}
