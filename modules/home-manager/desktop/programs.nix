{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    discord
    keepassxc
    krita
    mpc
    obsidian
    seahorse
    vlc
  ];
}
