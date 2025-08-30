{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@60.02, 0x0, 1"
      "HDMI-A-1, 1440x900@74.98, 1920x180, 1"
      "HDMI-A-2, 1920x1080@144, 0x0, 1"
    ];
    general = {
      border_size = 2;
      no_border_on_floating = false;
      gaps_in = 2;
      gaps_out = 8;
      gaps_workspaces = 48;
      "col.inactive_border" = "$surface0";
      "col.active_border" = "$blue";
      "col.nogroup_border" = "$surface0";
      "col.nogroup_border_active" = "$red";
      hover_icon_on_border = true;
    };
    decoration = {
      rounding = 8;
      rounding_power = 2;
      active_opacity = 1;
      inactive_opacity = 1;
      fullscreen_opacity = 1;
      dim_inactive = false;
      dim_strength = 0;
      dim_special = 0.2;
      dim_around = 0.2;
      border_part_of_window = true;
      blur = {
        enabled = true;
        size = 8;
        passes = 4;
        ignore_opacity = true;
        new_optimizations = true;
        xray = false;
        noise = 0.012;
        contrast = 0.9;
        brightness = 0.8;
        vibrancy = 0.2;
        vibrancy_darkness = 0;
        special = false;
        popups = false;
        popups_ignorealpha = 0.2;
        input_methods = false;
        input_methods_ignorealpha = 0.2;
      };
      shadow = {
        enabled = true;
        range = 1;
        render_power = 4;
        sharp = true;
        ignore_window = true;
        color = "$crust";
        color_inactive = "$crust";
        offset = "0 0";
        scale = 1;
      };
    };
    cursor = {
      sync_gsettings_theme = true;
    };
    animations = {
      enabled = true;
      first_launch_animation = false;
      bezier = [ "sharp, 0, 0.75, 0.25, 1" ];
      animation = [
        "windows, 1, 2.5, sharp, popin"
        "layers, 1, 2.5, sharp, fade"
        "layersOut, 1, 2.5, sharp, fade"
        "fade, 1, 2.5, sharp"
        "fadeOut, 1, 2.5, sharp"
        "border, 1, 2, sharp"
        "workspaces, 1, 2.5, sharp, slide"
      ];
    };
    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
      vfr = true;
      vrr = 0;
      background_color = "$crust";
    };
    windowrule = [
      "bordersize 0, floating:0, onworkspace:w[tv1]"
      "rounding 0, floating:0, onworkspace:w[tv1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"
    ];
    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
    ];
  };
  services = {
    hyprpaper = {
      enable = true;
      settings = let
        wallpaper = builtins.toString ../../../assets/nix-wallpaper.png;
      in {
        preload = [ wallpaper ];
        wallpaper = [ ("," + wallpaper) ];
      };
    };
  };
}
