{ config, lib, ... }:

let
  # use same margin as defined by hyprland config
  marginInline = config.wayland.windowManager.hyprland.settings.general.gaps_out;
  marginBlock = config.wayland.windowManager.hyprland.settings.general.gaps_in * 2;
in
{
  # if stylix is enabled, apply customizations to default css
  stylix.targets.waybar = lib.mkIf config.stylix.enable {
    addCss = false;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      spacing = 8;

      margin-top = marginBlock;
      margin-left = marginInline;
      margin-right = marginInline;
      margin-bottom = marginBlock - marginInline;

      modules-left = [
        "custom/nixos"
        "hyprland/workspaces"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "pulseaudio"
        "group/hardware"
        "group/power"
      ];

      "custom/nixos" = {
        format = "";
        on-click = "wofi --show drun";
        tooltip = false;
      };

      "custom/power" = {
        format = "󰐥";
        on-click = "shutdown now";
        tooltip = false;
      };

      "custom/reboot" = {
        format = "󰑓";
        on-click = "reboot";
        tooltip = false;
      };

      "custom/lock" = {
        format = "󰍁";
        on-click = "hyprlock";
        tooltip = false;
      };

      "group/hardware" = {
        orientation = "inherit";
        drawer = {
          transition-left-to-right = false;
          click-to-reveal = true;
        };
        modules = [ "cpu" "memory" "temperature" ];
      };

      "group/power" = {
        orientation = "inherit";
        drawer = {
          transition-left-to-right = false;
        };
        modules = [
          "custom/power"
          "custom/reboot"
          "custom/lock"
        ];
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{name}";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
        };
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%  {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [
            ""
            ""
            ""
          ];
        };
        on-click = "pavucontrol";
      };

      cpu = {
        format = " {usage}%";
        tooltip = true;
      };

      memory = {
        format = " {}%";
        tooltip = true;
      };

      temperature = {
        interval = 10;
        critical-threshold = 100;
        format-critical = " {temperatureC}";
        format = " {temperatureC}°C";
      };

      clock = {
        format = "{:%H:%M | %e %B}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
    };

    style = ''
      window#waybar {
        background: transparent;
        color: @base06;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        background: @base00;
        border: 1px solid @base03;
        border-radius: 12px;
        padding: 0 16px;
      }

      .modules-left:hover,
      .modules-center:hover,
      .modules-right:hover {
        border-color: @base0D;
      }

      .module {
        padding: 0 8px;
      }

      #custom-nixos,
      #custom-power,
      #custom-reboot,
      #custom-lock {
        font-size: 24px;
      }
    '';
  };
}
