{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enableXdgAutostart = true;

    settings = {
      # variables
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$browser" = "firefox";
      "$menu" = "wofi --show drun";
      "$screenshot" = "hyprshot -m region";

      monitor = [
        # rotate vertical monitor
        "DP-1, preferred, auto, 1, transform, 3"
        "DP-2, highrr, auto, 1"
        # default option as fallback
        ", preferred, auto, 1"
      ];
      env = [
        # nvidia
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
      ];
      bind = [
        # window management
        "$mod, C, killactive"
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, F, fullscreen, 1"
        "$mod SHIFT, F, fullscreen, 0"

        # application shortcuts
        "$mod, Q, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, B, exec, $browser"
        "$mod, E, exec, $fileManager"

        # screenshow
        "$mod, X, exec, $screenshot"

        # shift focus
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # select workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # move window to workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # special workspace
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        # move workspace with scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];
      bindm = [
        # move windows with mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      windowrule = [
        # supress maximize requests from apps
        "suppressevent maximize, class:."

        # fix for dragging issues with xwayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # lock discord to special workspace
        "workspace special:magic, class:^(discord)$"

        # aseprite
        "tile,class:Aseprite"

        # wofi
        "float,class:wofi"

        # bevy windows
        "float,class:daedalus"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
      cursor = {
        no_hardware_cursors = 1;
      };
      ecosystem = {
        no_update_news = true;
      };
      input = {
        kb_layout = "us,no";
        kb_variant = "altgr-intl,nodeadkeys";
        kb_options = "grp:caps_toggle,grp_led:scroll";

        sensitivity = 0;
        accel_profile = "flat";
      };
    };
  };
}
