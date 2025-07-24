# home-manager profile for greetd user
# DO NOT import via default.nix
{ config, lib, pkgs, ... }:
{
  imports = [
    ./hyprland/appearance.nix
    ./hyprland/input.nix
    ./graphicalToolkit.nix
    ./catppuccin.nix
  ];
  home.stateVersion = "25.05";
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings.exec-once = let 
    wlgreet = lib.getExe pkgs.greetd.wlgreet;
    hyprland = lib.getExe config.wayland.windowManager.hyprland.package;
  in [
    "${wlgreet} --command 'uwsm start ${hyprland}'; uwsm stop"
  ];
}
