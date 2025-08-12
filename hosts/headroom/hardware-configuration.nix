{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [
    "video=HDMI-A-1:1440x900@75"
    "video=HDMI-A-2:1920x1080@144"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=50%" "mode=755" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-label/NixOS";
      neededForBoot = true;
      fsType = "btrfs";
      options = [ "subvol=@persist" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/NixOS";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/Boot";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
