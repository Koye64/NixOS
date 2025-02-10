{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;

    systemd = {
      enable = true;
      xdgAutostart = true;
    };

    config = let
      cfg = config.wayland.windowManager.sway.config;
    in {
      terminal = "${pkgs.kitty}/bin/kitty";
      modifier = "Mod4";
      menu = "${lib.getExe pkgs.rofi} -show drun";
      bars = [];
      defaultWorkspace = "workspace number 1";

      window = {
        border = 2;
        hideEdgeBorders = "smart";
        titlebar = false;
        commands = [
          {
            command = "sticky true";
            criteria = {title = "Picture-in-Picture";};
          }
          {
            command = "allow_tearing yes";
            criteria = {app_id = "^(?!firefox).*$";};
          }
        ];
      };

      floating = {
        border = 2;
        titlebar = false;
        criteria = [
          {title = "Steam - Update News";}
          {app_id = "org.pulseaudio.pavucontrol";}
          {title = "Calculator";}
          {title = "Picture-in-Picture";}
        ];
      };

      gaps = {
        inner = 4;
        outer = 4;
        smartBorders = "on";
        smartGaps = true;
      };

      colors = {
        focusedInactive.indicator = lib.mkForce cfg.colors.focusedInactive.border;
        unfocused.indicator = lib.mkForce cfg.colors.unfocused.border;
      };

      startup = [
        {command = "${lib.getExe pkgs.autotiling}";}
        {
          command = "systemctl restart --user waybar";
          always = true;
        }
      ];

      input = {
        "type:pointer" = {
          accel_profile = "flat";
        };
        "type:keyboard" = {
          xkb_numlock = "enabled";
        };
        "type:touchpad" = {
          accel_profile = "adaptive";
          dwt = "enabled";
          middle_emulation = "enabled";
          natural_scroll = "enabled";
          tap = "enabled";
        };
      };

      output = {
        "*" = {
          scale = "1";
          subpixel = "none";
          allow_tearing = "yes";
          max_render_time = "off";
        };
        "Virtual-1" = {
          mode = "1440x900@60Hz";
        };
        "DP-1" = {
          mode = "1920x1080@144.001007Hz";
          position = "1440,0";
        };
        "HDMI-A-1" = {
          mode = "1440x900@75Hz";
          position = "0,0";
        };
      };

      assigns = {
        "3" = [
          {title = "Steam";}
          {class = "Minecraft*";}
        ];
        "8" = [{app_id = "cinny";}];
        "9" = [{class = "discord";}];
        "10" = [{class = "Spotify";}];
      };

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "eDP-1";
        }
        {
          workspace = "1";
          output = "DP-1";
        }
        {
          workspace = "2";
          output = "DP-1";
        }
        {
          workspace = "3";
          output = "DP-1";
        }
        {
          workspace = "4";
          output = "DP-1";
        }
        {
          workspace = "5";
          output = "DP-1";
        }
        {
          workspace = "6";
          output = "HDMI-A-1";
        }
        {
          workspace = "7";
          output = "HDMI-A-1";
        }
        {
          workspace = "8";
          output = "HDMI-A-1";
        }
        {
          workspace = "9";
          output = "HDMI-A-1";
        }
      ];

      keybindings = {
        "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
        "${cfg.modifier}+c" = "kill";
        "${cfg.modifier}+r" = "exec ${cfg.menu}";

        "${cfg.modifier}+${cfg.left}" = "focus left";
        "${cfg.modifier}+${cfg.down}" = "focus down";
        "${cfg.modifier}+${cfg.up}" = "focus up";
        "${cfg.modifier}+${cfg.right}" = "focus right";

        "${cfg.modifier}+Left" = "focus left";
        "${cfg.modifier}+Down" = "focus down";
        "${cfg.modifier}+Up" = "focus up";
        "${cfg.modifier}+Right" = "focus right";

        "${cfg.modifier}+Shift+${cfg.left}" = "move left";
        "${cfg.modifier}+Shift+${cfg.down}" = "move down";
        "${cfg.modifier}+Shift+${cfg.up}" = "move up";
        "${cfg.modifier}+Shift+${cfg.right}" = "move right";

        "${cfg.modifier}+Shift+Left" = "move left";
        "${cfg.modifier}+Shift+Down" = "move down";
        "${cfg.modifier}+Shift+Up" = "move up";
        "${cfg.modifier}+Shift+Right" = "move right";

        "${cfg.modifier}+f" = "fullscreen toggle";
        "${cfg.modifier}+n" = "split toggle";

        "${cfg.modifier}+p" = "sticky toggle";
        "${cfg.modifier}+v" = "floating toggle";
        "${cfg.modifier}+space" = "focus mode_toggle";

        "${cfg.modifier}+1" = "workspace number 1";
        "${cfg.modifier}+2" = "workspace number 2";
        "${cfg.modifier}+3" = "workspace number 3";
        "${cfg.modifier}+4" = "workspace number 4";
        "${cfg.modifier}+5" = "workspace number 5";
        "${cfg.modifier}+6" = "workspace number 6";
        "${cfg.modifier}+7" = "workspace number 7";
        "${cfg.modifier}+8" = "workspace number 8";
        "${cfg.modifier}+9" = "workspace number 9";
        "${cfg.modifier}+0" = "workspace number 10";

        "${cfg.modifier}+Shift+1" = "move container to workspace number 1";
        "${cfg.modifier}+Shift+2" = "move container to workspace number 2";
        "${cfg.modifier}+Shift+3" = "move container to workspace number 3";
        "${cfg.modifier}+Shift+4" = "move container to workspace number 4";
        "${cfg.modifier}+Shift+5" = "move container to workspace number 5";
        "${cfg.modifier}+Shift+6" = "move container to workspace number 6";
        "${cfg.modifier}+Shift+7" = "move container to workspace number 7";
        "${cfg.modifier}+Shift+8" = "move container to workspace number 8";
        "${cfg.modifier}+Shift+9" = "move container to workspace number 9";
        "${cfg.modifier}+Shift+0" = "move container to workspace number 10";

        "${cfg.modifier}+Shift+minus" = "move scratchpad";
        "${cfg.modifier}+minus" = "scratchpad show";

        "${cfg.modifier}+Shift+c" = "reload";
        "${cfg.modifier}+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

        "${cfg.modifier}+q" = "mode resize";

        "${cfg.modifier}+Shift+s" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy'';
        "Print" = ''exec ${lib.getExe pkgs.grim} -o "$(${pkgs.sway}/bin/swaymsg -t get_outputs | ${lib.getExe pkgs.jq} -r '.[] | select(.focused) | .name') - | ${pkgs.wl-clipboard}/bin/wl-copy" - | ${pkgs.wl-clipboard}/bin/wl-copy'';
        "Shift+Print" = ''exec ${lib.getExe pkgs.grim} - | ${pkgs.wl-clipboard}/bin/wl-copy'';
        "--whole-window --border ${cfg.modifier}+button5" = "workspace next_on_output";
        "--whole-window --border ${cfg.modifier}+button4" = "workspace prev_on_output";
      };
    };

    extraConfig = ''
      bindgesture swipe:left workspace next_on_output
      bindgesture swipe:right workspace prev_on_output
    '';
  };
}
