{
  config,
  lib,
  ...
}: let
  cfg = config.firefox;
in {
  options.firefox = {
    enable = lib.mkEnableOption "enable Firefox config";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
