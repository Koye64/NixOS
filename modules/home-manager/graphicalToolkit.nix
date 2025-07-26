{ pkgs, ... }:
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = let
    extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  in {
    enable = true;
    gtk3 = { inherit extraConfig; };
    gtk4 = { inherit extraConfig; };
  };
  qt = { enable = true; };
}
