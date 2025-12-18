{
  config,
  catppuccin,
  inputs,
  lib,
  ...
}: let
  cfg = config.color-scheme;
in {
  options.color-scheme = {
    enable = lib.mkEnableOption "enable user module";
    flavor = lib.mkOption {
      default = catppuccin.flavor;
      description = "color scheme variant";
    };
    accent = lib.mkOption {
      default = catppuccin.accent;
      description = "accent color";
    };
  };

  imports = [inputs.catppuccin.homeModules.catppuccin];

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      inherit (cfg) flavor;
      inherit (cfg) accent;

      cursors = {
        enable = true;
        accent = "dark";
      };

      firefox.force = true;
    };
  };
}
