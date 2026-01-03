# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.dms.nixosModules.greeter
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  my-localization.enable = true;
  color-scheme.enable = true;
  vr.enable = true;

  networking.hostName = "bunnybuck";
  networking.networkmanager.enable = true;

  main-user = {
    enable = true;
    userName = "koye";
    userDescription = "Koye";
    homeConfig = ./home.nix;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs = {
    dankMaterialShell.greeter = {
      enable = true;
      compositor = {
        name = "niri";
        customConfig = config.home-manager.users.koye.xdg.configFile."niri/config.kdl".text;
      };
      configHome = "/home/koye";
    };

    niri.enable = true;

    steam = {
      enable = true;
      extraPackages = with pkgs; [
        gamescope
      ];
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    uwsm = {
      enable = true;
      waylandCompositors = {
        niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/niri-session";
        };
      };
    };
  };

  services = {
    flatpak.enable = true;

    openssh.enable = true;

    udisks2.enable = true;

    power-profiles-daemon.enable = true;
  };

  system.stateVersion = "25.11";
}
