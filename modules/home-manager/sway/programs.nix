{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  services.swayidle = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
    tray = "never";
  };

  services.dunst = {
    enable = true;
  };

  services.swayosd = {
    enable = true;
  };
}
