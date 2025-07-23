{ config, pkgs, lib, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      twitter-color-emoji
      nerd-fonts.jetbrains-mono
      noto-fonts
    ];
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans"];
        emoji = [ "Twitter Color Emoji" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
  programs = {
    regreet = {
      enable = true;
      cageArgs = [ "-s" "-m" "last" ];
      settings = {
        background = {
          path = ../../assets/img/nix-wallpaper.png;
          fit = "Fill";
        };
        GTK = {
          application_prefer_dark_theme = true;
        };
      };
    };
    steam = {
      enable = true;
      gamescopeSession = { enable = true; };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      extest.enable = true;
    };
  };
  services = {
    greetd = { enable = true; };
    udisks2 = { enable = true; };
  };
}
