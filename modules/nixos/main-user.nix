{ lib, config, pkgs, ... }:
let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "user";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "Main user";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" ];
    };
    programs.zsh.enable = true;
  };
}
