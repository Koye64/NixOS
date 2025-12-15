{ config, inputs, lib, ... }:
let
  cfg = config.color-scheme;
in
{
  options.color-scheme = {
    enable = lib.mkEnableOption "enable user module";
    flavor = lib.mkOption {
      default = "mocha";
      description = "color scheme variant";
    };
    accent = lib.mkOption {
      default = "blue";
      description = "accent color";
    };
  };

  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  config = lib.mkIf cfg.enable {
    catppuccin = {
      enable = true;
      flavor = cfg.flavor;
      accent = cfg.accent;

      cursors = {
        enable = true;
        accent = cfg.accent;
      };
    };
  };
}
