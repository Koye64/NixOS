{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    discord
    keepassxc
    krita
    obsidian
    seahorse
    vlc
  ];
}
