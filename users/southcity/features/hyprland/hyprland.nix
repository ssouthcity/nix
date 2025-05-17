{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        "DP-1, prefered, auto, 1, transform, 3"
        ", prefered, auto, 1"
      ];
      env = [
        # Nvidia env vars
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
      ];
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      bind = [
        "SUPER, B, exec, firefox"
        "SUPER, Q, exec, kitty"
      ];
      general = {
        border_size = 4;
      };
      decoration = {
        rounding = 4;
      };
      cursor = {
        no_hardware_cursors = 1;
      };
    };
  };  
}
