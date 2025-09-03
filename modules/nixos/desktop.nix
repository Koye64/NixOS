{ config, pkgs, lib, ... }:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };
  };
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
    dconf = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession = { enable = true; };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      extest.enable = true;
    };
    virt-manager.enable = true;
  };
  services = {
    udisks2 = { enable = true; };
    gnome.gnome-keyring.enable = true;
  };
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
  };
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
  users.users.koye.extraGroups = [
    "libvirtd"
    "docker"
  ];
}
