{ pkgs, ... }:
{
  stylix.enable = true;

  stylix.image = ./wallpapers/sunflowers-painting.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

  stylix.polarity = "dark";

  stylix.cursor = {
    name = "Capitaine Cursors (Gruvbox)";
    size = 24;
    package = pkgs.capitaine-cursors-themed;
  };

  stylix.iconTheme = {
    enable = true;
    dark = "Gruvbox-Plus-Dark";
    light = "Gruvbox-Plus-Light";
    package = pkgs.gruvbox-plus-icons;
  };

  stylix.fonts = {
    serif = {
      name = "Noto Serif";
      package = pkgs.noto-fonts;
    };

    sansSerif = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
    };

    monospace = {
      name = "MesloLGS Nerd Font Mono";
      package = pkgs.nerd-fonts.meslo-lg;
    };

    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji;
    };

    sizes = {
      desktop = 12;
    };
  };
}
