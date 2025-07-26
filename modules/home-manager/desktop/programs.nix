{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aseprite
    vlc
  ];
}
