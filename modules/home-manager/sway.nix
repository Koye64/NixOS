{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  wayland.windowManager.sway = {
    enable = true;
    config =
    let
      cfg = config.wayland.windowManager.sway.config;
    in {
      terminal = "${pkgs.kitty}/bin/kitty";
      modifier = "Mod4";
      menu = "${pkgs.fuzzel}/bin/fuzzel";
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
      output = {
        "*" = {
	  scale = "1";
	  subpixel = "none";
	  allow_tearing = "yes";
	  max_render_time = "off";
	};
	"Virtual-1" = {
	  mode = "1920x1080@60Hz";
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
      };
    };
  };
}
