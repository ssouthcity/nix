{
  flake.homeModules.discord =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.discord
      ];

      xdg.autostart.entries = [
        "${pkgs.discord}/share/applications/discord.desktop"
      ];
    };
}
