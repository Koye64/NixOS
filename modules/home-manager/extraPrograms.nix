{ pkgs, ... }:
{
  home.packages = with pkgs; [
    audacity
    aseprite
    blender
    discord
    distrobox
    keepassxc
    krita
    mpc
    obsidian
    prismlauncher
    puddletag
    seahorse
    typst
    vlc
    yt-dlp
  ];
}
