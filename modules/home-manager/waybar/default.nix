{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd = { enable = true; };
    style = builtins.readFile ./style.css;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "sway/workspaces" "hyprland/window" "sway/window" ];
        # modules-center = [ "mpris" ];
        modules-right = [ "pulseaudio" "backlight" "power-profiles-daemon" "battery" "clock" "tray" "custom/lock" "idle_inhibitor" ];
        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace m-1";
          on-scroll-down = "hyprctl dispatch workspace m+1";
        };
        "hyprland/window" = {
          separate-outputs = true;
        };
        "sway/window" = {
          all-outputs = true;
        };
        power-profiles-daemon = {
          format = "{icon}";
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        tray = {
          icon-size = 16;
          spacing = 8;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y/%m/%d}";
          format = "{:%I:%M %p}";
        };
        backlight = {
          format = "{icon}";
          tooltip-format = "Backlight {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 ({capacity}%)";
          format-full = "{icon}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" " "];
          };
          on-click = "${lib.getExe pkgs.pavucontrol}";
        };
        "custom/lock" = {
          tooltip = false;
          on-click = "loginctl lock-session";
          format = "";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰛐";
          };
          tooltip-format-activated = "awake";
          tooltip-format-deactivated = "idle";
        };
      };
    };
  };
}
