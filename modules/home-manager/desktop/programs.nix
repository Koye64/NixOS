{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    discord
    krita
    obsidian
    seahorse
    vlc
  ];
}
