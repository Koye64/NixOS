{
  config,
  lib,
  ...
}: let
  cfg = config.vr;
in {
  options.vr = {
    enable = lib.mkEnableOption "enable VR streaming configuration";
  };
  config = {
    networking.networkmanager.settings = lib.mkIf cfg.enable {
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
    services.wivrn = lib.mkIf cfg.enable {
      enable = true;
      openFirewall = true;
      defaultRuntime = true;
      autoStart = true;
    };
  };
}
