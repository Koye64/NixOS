{
  modulesPath,
  lib,
  pkgs,
  ...
} @ args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ../../modules/nixos/console.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/nix.nix
    ./disk-config.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ./server.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = false;
  };

  services.openssh.enable = true;

  networking.hostName = "koye64";

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.mutableUsers = false;
  users.users.koye = {
    initialHashedPassword = "$6$lYhDMNUaETVWJ4qK$49oxUqlabdpkf7AcGJMQmk2gTDhm3/xBcqry6bBMxa1HdKLWsaTlLUe5omlNb7nxh5W4zLJculNq3xxZGNB7b/";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBBOK926Yj1GWO8ZtxbJogbzD+3h2usj51Z590sfIyLp koye@headroom"
    ];
  };
  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBBOK926Yj1GWO8ZtxbJogbzD+3h2usj51Z590sfIyLp koye@headroom"
  ];

  system.stateVersion = "25.05";
}
