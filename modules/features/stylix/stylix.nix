{ inputs, ... }:
let
  wallpaper = ./wallpapers/sunflowers-painting.png;
  base16SchemeFile = pkgs: "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

  cursor = pkgs: {
    name = "Capitaine Cursors (Gruvbox)";
    size = 24;
    package = pkgs.capitaine-cursors-themed;
  };

  icons = pkgs: {
    enable = true;
    dark = "Gruvbox-Plus-Dark";
    light = "Gruvbox-Plus-Light";
    package = pkgs.gruvbox-plus-icons;
  };

  fonts = pkgs: {
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
      package = pkgs.noto-fonts-color-emoji;
    };
    sizes.desktop = 12;
  };
in
{
  flake-file.inputs = {
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.stylix =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.nixosModules.stylix ];

      stylix = {
        enable = true;
        image = wallpaper;
        base16Scheme = base16SchemeFile pkgs;
        polarity = "dark";
        cursor = cursor pkgs;
        icons = icons pkgs;
        fonts = fonts pkgs;
      };
    };

  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
        image = wallpaper;
        base16Scheme = base16SchemeFile pkgs;
        polarity = "dark";
        cursor = cursor pkgs;
        icons = icons pkgs;
        fonts = fonts pkgs;
      };
    };
}
