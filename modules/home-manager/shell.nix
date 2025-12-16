{
  config,
  lib,
  ...
}: let
  cfg = config.shell;
in {
  options.shell = {
    enable = lib.mkEnableOption "enable user module";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      bash = {
        enable = true;
      };

      fish = {
        enable = true;
      };

      git = {
        enable = true;
      };

      lazygit = {
        enable = true;
      };

      nh = {
        enable = true;
        flake = /home/koye/nixos;
      };

      starship = {
        enable = true;
        enableTransience = true;
      };

      zsh = {
        enable = true;
      };
    };
  };
}
