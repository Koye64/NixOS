{ lib, config, pkgs, ... }:
let
  cfg = config.niri;
in
{
  options.niri = {
    enable = lib.mkEnableOption "enable niri module";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
  };
}
