{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    pavucontrol
  ];
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
    style = lib.mkForce ./waybar.css;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/scratchpad"
          "sway/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "backlight"
          "battery"
          "tray"
          "power-profiles-daemon"
        ];
        "sway/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          warp-on-scroll = false;
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "awake";
            deactivated = "passive";
          };
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 10;
          format = "{:%A %I:%M %p}";
          format-alt = "{:%B %d, %Y}";
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          on-scroll-up = "${lib.getExe pkgs.brightnessctl} set +1%";
          on-scroll-down = "${lib.getExe pkgs.brightnessctl} set 1%-";
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{icon}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%)  ";
          format-ethernet = "{ipaddr}/{cidr}  ";
          tooltip-format = "{ifname} via {gwaddr} 󰩠";
          format-linked = "{ifname} (No IP) 󰅛";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ipaddr}/{cidr}";
        };
        pulseaudio = {
          scroll-step = 1;
          format = "{volume}% {icon}  {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "  {icon} {format_source}";
          format-muted = "  {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "${lib.getExe pkgs.pavucontrol}";
          ignored-sinks = [
            "Easy Effects Sink"
          ];
        };
      };
    };
  };
}
