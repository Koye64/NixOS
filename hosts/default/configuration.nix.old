{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # services.xserver.enable = true;
  #
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };

  users.users.koye = {
    isNormalUser = true;
    description = "Koye";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
  ];

  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}
