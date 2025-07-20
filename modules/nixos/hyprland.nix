{ inputs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;
    uwsm.enable = true;
  };
  services.hypridle.enable = true;
}
