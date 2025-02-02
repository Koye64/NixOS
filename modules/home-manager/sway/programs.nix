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
    systemdTarget = "sway-session.target";
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock-effects}/bin/swaylock -fF"; }
      { event = "lock"; command = "${pkgs.swaylock-effects}/bin/swaylock -fF"; }
    ];
    timeouts = [
      { timeout = 60; command = "${pkgs.swaylock-effects}/bin/swaylock -fF"; }
    ];
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
