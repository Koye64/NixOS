{ config, ... }:
{
  imports = [
    ./appearance.nix
    ./input.nix
    ./keybinds.nix
    ./rules.nix
    ./services.nix
    ./settings.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
  };
  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
