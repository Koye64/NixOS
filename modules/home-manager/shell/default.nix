{
  config,
  lib,
  pkgs,
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

      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [batdiff batman batgrep];
      };

      btop = {
        enable = true;
      };

      cava = {
        enable = true;
        settings = {
          general.framerate = 144;
          smoothing.noise_reduction = 14;
        };
      };

      eza = {
        enable = true;
        icons = "auto";
      };

      fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
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
        settings = lib.importTOML ./starship.toml;
      };

      zsh = {
        enable = true;
      };
    };
  };
}
