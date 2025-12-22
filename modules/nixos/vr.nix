{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.vr;
in {
  options.vr = {
    enable = lib.mkEnableOption "enable VR streaming configuration";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [wlx-overlay-s];
    networking.networkmanager.settings = {
      connection-wifi = {
        match-device = "type:wifi";
        "ipv4.route-metric" = 100;
        "ipv6.route-metric" = 100;
      };
      connection-ethernet = {
        match-device = "type:ethernet";
        "ipv4.route-metric" = 200;
        "ipv6.route-metric" = 200;
      };
    };
    services.wivrn = {
      enable = true;
      openFirewall = true;
      defaultRuntime = true;
      autoStart = true;
    };
  };
}
