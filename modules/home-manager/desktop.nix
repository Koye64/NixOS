{ config, lib, pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans"];
        emoji = [ "Twitter Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
  gtk = { enable = true; };
  qt = { enable = true; };
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
