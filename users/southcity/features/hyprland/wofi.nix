{ pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = {
      normal_window = true;
      allow_images = true;
      allow_markup = true;

      dmenu-parse_action = true;

      width = 640;
      height = 480;
    };
  };

  # custom wofi menus
  home.packages = [
    (pkgs.writeShellApplication {
      name = "wofi-power-menu";
      runtimeInputs = [
        pkgs.wofi
      ];
      text = ''
        options="\
        img:${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark/apps/scalable/system-log-out.svg:text:Logout
        img:${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark/apps/scalable/system-reboot.svg:text:Reboot
        img:${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark/apps/scalable/system-shutdown.svg:text:Shutdown"

        picked=$(echo "$options" | wofi --show dmenu)

        case "$picked" in 
          Logout)
            hyprctl dispatch exit
            ;;
          Reboot)
            systemctl reboot
            ;;
          Shutdown)
            systemctl poweroff
            ;;
        esac
      '';
    })
  ];
}
