{ pkgs, ... }:

{
  environment.defaultPackages = [ ];
  services.xserver.excludePackages = [ pkgs.xterm ];
  programs.nano.enable = false;
}
