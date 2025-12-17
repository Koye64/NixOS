# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  my-localization.enable = true;

  networking.hostName = "virtual-pen";
  networking.networkmanager.enable = true;

  main-user = {
    enable = true;
    userName = "koye";
    homeConfig = ./home.nix;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.niri.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
