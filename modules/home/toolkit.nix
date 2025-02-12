{
  config,
  pkgs,
  ...
}: {
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
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "";
      };
    };
  };
}
