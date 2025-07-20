{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "virtio_scsi" "usb_storage" "sd_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=25%" "mode=755" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/fa462d19-4dff-4995-be2a-ea3b296eebfc";
      neededForBoot = true;
      fsType = "btrfs";
      options = [ "subvol=@persist" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/fa462d19-4dff-4995-be2a-ea3b296eebfc";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/fa462d19-4dff-4995-be2a-ea3b296eebfc";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4060-FE58";
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
}
