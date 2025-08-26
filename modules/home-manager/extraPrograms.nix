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
    seahorse
    vlc
    yt-dlp
  ];
}
