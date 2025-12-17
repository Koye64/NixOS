{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wm;
in {
  options.wm = {
    enable = lib.mkEnableOption "enable Firefox config";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
    programs = {
      rofi.enable = true;
      waybar = {
        enable = true;
        systemd.enable = true;
      };
      zathura.enable = true;
    };
    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      gtk4 = {
        colorScheme = "dark";
      };
    };
    qt = {
      enable = true;
      style.name = "kvantum";
    };
    home.pointerCursor = {
      enable = true;
      x11.enable = true;
      gtk.enable = true;
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "";
      };
    };
  };
}
