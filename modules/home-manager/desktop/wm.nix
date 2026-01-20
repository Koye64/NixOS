{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.wm;
in {
  options.wm = {
    enable = lib.mkEnableOption "enable window manager config";
  };

  config = lib.mkIf cfg.enable {
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
      enable = false;
      style.name = "kvantum";
    };
    home.packages = with pkgs; [
      kde-rounded-corners
      kdePackages.krohnkite
      klassy
    ];
    home.pointerCursor = {
      enable = true;
      x11.enable = true;
      gtk.enable = true;
      size = 24;
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "";
      };
    };
    xdg.userDirs = let
      home = "${config.home.homeDirectory}";
    in {
      enable = true;
      createDirectories = true;
      desktop = "${home}/desktop";
      documents = "${home}/documents";
      download = "${home}/downloads";
      music = "${home}/music";
      pictures = "${home}/pictures";
      publicShare = "${home}/public";
      templates = "${home}/templates";
      videos = "${home}/videos";
    };
  };
}
