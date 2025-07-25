{ config, lib, pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
    };
    fuzzel = {
      enable = true;
      settings = let
        hyprlandSettings = config.wayland.windowManager.hyprland.settings;
      in {
        main = {
          use-bold = true;
          launch-prefix = "uwsm app --";
          placeholder = "Launch...";
          prompt = ''"❯ "'';
          terminal = "${lib.getExe config.programs.kitty.package}";
        };
        border.width = hyprlandSettings.general.border_size;
        border.radius = hyprlandSettings.decoration.rounding;
      };
    };
  };
  services = {
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
    easyeffects = {
      enable = true;
    };
    mako = {
      enable = true;
      settings = let
        explode = "exec ${lib.getExe pkgs.mpv} " + builtins.toString ../../assets/collide.wav;
      in {
        border-radius = config.wayland.windowManager.hyprland.settings.decoration.rounding;
        default-timeout = 5000;
        group-by = "app-name";
        ignore-timeout = 1;
        "urgency=normal" = {
          on-notify = explode;
        };
        "urgency=high" = {
          default-timeout = 0;
          on-notify = explode;
        };
      };
    };
  };
  xdg = {
    enable = true;
    userDirs = { enable = true; };
  };
}
