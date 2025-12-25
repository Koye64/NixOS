{
  lib,
  config,
  catppuccin,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.main-user;
in {
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "user";
      description = ''
        username
      '';
    };

    userDescription = lib.mkOption {
      default = "User";
      description = ''
        user's description (full name)
      '';
    };

    shell = lib.mkOption {
      default = pkgs.fish;
      description = ''
        user's default shell
      '';
    };

    homeConfig = lib.mkOption {
      default = ./home.nix;
      description = ''
        location of the user's home.nix configuration
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = cfg.userDescription;
      inherit (cfg) shell;
      extraGroups = [
        "input"
        "wheel"
      ];
    };

    programs = {
      bash.enable = true;
      zsh.enable = true;
      fish.enable = true;
    };

    home-manager = {
      extraSpecialArgs = {
        inherit inputs;
        inherit catppuccin;
      };
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup";
      users.${cfg.userName}.imports = [
        cfg.homeConfig
        inputs.dms.homeModules.dankMaterialShell.default
        ../home-manager
      ];
    };
  };
}
