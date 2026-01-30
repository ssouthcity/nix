{
  flake.homeModules.social =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [ "discord" ];

      home.packages = [
        pkgs.discord
      ];

      xdg.autostart = {
        enable = true;
        entries = [
          "${pkgs.discord}/share/applications/discord.desktop"
        ];
      };
    };
}
