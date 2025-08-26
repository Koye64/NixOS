{ pkgs, ... }:
{
  home.packages = with pkgs; [
    audacity
    aseprite
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
