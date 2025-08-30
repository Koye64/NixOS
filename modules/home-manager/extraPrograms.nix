{ pkgs, ... }:
{
  home.packages = with pkgs; [
    audacity
    aseprite
    blender
    discord
    keepassxc
    krita
    mpc
    obsidian
    puddletag
    seahorse
    vlc
    yt-dlp
  ];
}
