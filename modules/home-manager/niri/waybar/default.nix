{
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        modules-left = ["niri/workspaces" "niri/window"];
        modules-right = ["tray" "pulseaudio" "backlight" "power-profiles-daemon" "battery" "clock" "idle_inhibitor"];
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
        idle_inhibitor = {
          format = "{icon} ";
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
