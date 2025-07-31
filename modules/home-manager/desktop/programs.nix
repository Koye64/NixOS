{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    discord
    seahorse
    vlc
  ];
}
