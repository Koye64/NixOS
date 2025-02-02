{ pkgs, ... }:

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
      name = "Papirus Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf = {
    enable = true;
  };
}
