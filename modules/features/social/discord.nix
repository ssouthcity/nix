{
  flake.homeModules.social =
    { pkgs, ... }:
    {
      allowedUnfreePackages = [
        "discord"
        "discord-unwrapped"
      ];

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
