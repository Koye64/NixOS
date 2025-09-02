{ lib, pkgs, config, ... }:
{
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe config.programs.sway.package}";
          user = "greeter";
        };
      };
    };
  };
  users.users.greeter = {
    createHome = true;
    home = "/var/greeter";
  };
  home-manager.users.greeter = ../home-manager/greeter.nix;
}
