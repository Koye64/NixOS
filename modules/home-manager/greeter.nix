# home-manager profile for greetd user
# DO NOT import via default.nix
{ config, lib, pkgs, ... }:
{
  imports = [
    ./sway/appearance.nix
    ./sway/input.nix
    ./sway/settings.nix
    ./graphicalToolkit.nix
    ./catppuccin.nix
  ];
  home.stateVersion = "25.05";
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.sway.config.startup = let 
    wlgreet = lib.getExe pkgs.wlgreet;
    session = lib.getExe config.wayland.windowManager.sway.package;
  in [
    { command = "${wlgreet} --command 'uwsm start -- sh -c \"WLR_SCENE_DISABLE_DIRECT_SCANOUT=1 WLR_DRM_NO_ATOMIC=1 ${session}\"'; uwsm stop";
      always = false;
    }
  ];
}
