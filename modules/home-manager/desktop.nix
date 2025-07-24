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
    mako = { enable = true; };
  };
  xdg = {
    enable = true;
    userDirs = { enable = true; };
  };
}
