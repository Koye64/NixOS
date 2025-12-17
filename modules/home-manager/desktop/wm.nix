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
    programs = {
      rofi.enable = true;
      waybar = {
        enable = true;
      };
      zathura.enable = true;
    };
    gtk = {
      enable = true;
    };
    qt = {
      enable = true;
      style.name = "kvantum";
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
