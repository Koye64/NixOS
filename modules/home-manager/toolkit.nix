{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    style = {
      name = "kvantum";
    };
    platformTheme.name = "kvantum";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = config.gtk.gtk3.extraConfig;
  };

  dconf = {
    enable = true;
  };
}
