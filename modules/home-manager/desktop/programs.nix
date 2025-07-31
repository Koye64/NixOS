{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    discord
    krita
    seahorse
    vlc
  ];
}
