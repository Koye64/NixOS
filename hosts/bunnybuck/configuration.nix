# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  my-localization.enable = true;
  color-scheme.enable = true;

  networking.hostName = "bunnybuck";
  networking.networkmanager.enable = true;

  main-user = {
    enable = true;
    userName = "koye";
    homeConfig = ./home.nix;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.niri.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
