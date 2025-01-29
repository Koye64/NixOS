{ config, pkgs, ... }:

{
  home.username = "koye";
  home.homeDirectory = "/home/koye";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
