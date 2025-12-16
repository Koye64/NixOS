{
  lib,
  config,
  ...
}: let
  cfg = config.localization;
in {
  options.localization = {
    enable = lib.mkEnableOption "enable US localization";

    timeZone = lib.mkOption {
      default = "America/Phoenix";
      description = ''
        the local timezone (time.timeZone)
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = cfg.timeZone;

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
