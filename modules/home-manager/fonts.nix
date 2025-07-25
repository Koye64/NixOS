{ pkgs, ... }:
{
  home.packages = with pkgs; [
    twitter-color-emoji
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans"];
        emoji = [ "Twitter Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
