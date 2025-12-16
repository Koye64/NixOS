{
  lib,
  config,
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

    shell = lib.mkOption {
      default = pkgs.zsh;
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
      description = "Main user";
      inherit (cfg) shell;
      extraGroups = ["wheel"];
    };
    programs.zsh.enable = true;

    home-manager = {
      extraSpecialArgs = {inherit inputs;};
      users.${cfg.userName}.imports = [
        cfg.homeConfig
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
