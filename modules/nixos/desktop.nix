{ config, pkgs, lib, ... }:
{
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
