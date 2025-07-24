{ pkgs, ... }:
{
  home.packages = with pkgs; [
    twitter-color-emoji
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
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
  gtk = { enable = true; };
  qt = { enable = true; };
}
