{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  programs.swaylock = {
    enable = true;
  };

  services.swayidle = {
    enable = true;
  };

  services.dunst = {
    enable = true;
  };

  services.swayosd = {
    enable = true;
  };

  wayland.windowManager.sway = {
    enable = true;
    config =
    let
      cfg = config.wayland.windowManager.sway.config;
    in {
      terminal = "${pkgs.kitty}/bin/kitty";
      modifier = "Mod4";
      menu = "${lib.getExe pkgs.rofi} -show drun";
      bars = [];
      window = {
        border = 2;
        hideEdgeBorders = "smart";
	titlebar = false;
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
        { command = "${lib.getExe pkgs.autotiling}"; }
      ];
      input = {
        "*" = {
	  accel_profile = "flat";
	  dwt = "enabled";
	  tap = "enabled";
	};
	"1739:52759:SYNA32EA:00_06CB:CE17_Touchpad" = {
	  natural_scroll = "enabled";
	  accel_profile = "adaptive";
	  middle_emulation = "enabled";
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
	  mode = "1920x1080@144Hz";
	  position = "1440,0";
	};
	"HDMI-A-1" = {
	  mode = "1440x900@75Hz";
	  position = "0,180";
	};
      };
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
       # "${cfg.modifier}+b" = "splith";
       # "${cfg.modifier}+v" = "splitv";
       # "${cfg.modifier}+a" = "focus parent";
       #
       # "${cfg.modifier}+s" = "layout stacking";
       # "${cfg.modifier}+w" = "layout tabbed";
       # "${cfg.modifier}+e" = "layout toggle split";
 
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
 
       "${cfg.modifier}+Shift+1" =
 	      "move container to workspace number 1";
       "${cfg.modifier}+Shift+2" =
 	      "move container to workspace number 2";
       "${cfg.modifier}+Shift+3" =
 	      "move container to workspace number 3";
       "${cfg.modifier}+Shift+4" =
 	      "move container to workspace number 4";
       "${cfg.modifier}+Shift+5" =
 	      "move container to workspace number 5";
       "${cfg.modifier}+Shift+6" =
 	      "move container to workspace number 6";
       "${cfg.modifier}+Shift+7" =
 	      "move container to workspace number 7";
       "${cfg.modifier}+Shift+8" =
 	      "move container to workspace number 8";
       "${cfg.modifier}+Shift+9" =
 	      "move container to workspace number 9";
       "${cfg.modifier}+Shift+0" =
 	      "move container to workspace number 10";
 
       "${cfg.modifier}+Shift+minus" = "move scratchpad";
       "${cfg.modifier}+minus" = "scratchpad show";
 
       "${cfg.modifier}+Shift+c" = "reload";
       "${cfg.modifier}+e" =
	      "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

       "${cfg.modifier}+q" = "mode resize";

       "${cfg.modifier}+Shift+s" = ''exec ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp} -d)" - | ${pkgs.wl-clipboard}/bin/wl-copy'';
       "Print" = ''exec ${lib.getExe pkgs.grim} -o "$(${pkgs.sway}/bin/swaymsg -t get_outputs | ${lib.getExe pkgs.jq} -r '.[] | select(.focused) | .name') - | ${pkgs.wl-clipboard}/bin/wl-copy" - | ${pkgs.wl-clipboard}/bin/wl-copy'';
       "Shift+Print" = ''exec ${lib.getExe pkgs.grim} - | ${pkgs.wl-clipboard}/bin/wl-copy'';
      };
    };
  };
}
