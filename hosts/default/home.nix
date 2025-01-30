{ config, pkgs, ... }:

{
  home.username = "koye";
  home.homeDirectory = "/home/koye";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
