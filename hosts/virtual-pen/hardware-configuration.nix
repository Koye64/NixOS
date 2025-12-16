{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  boot = {
    initrd = {
      availableKernelModules = ["ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk"];
      kernelModules = [];

      luks.devices."luks-329b2a03-7081-4e91-8599-fae4a3452f18".device = "/dev/disk/by-uuid/329b2a03-7081-4e91-8599-fae4a3452f18";
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };
  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-329b2a03-7081-4e91-8599-fae4a3452f18";
      fsType = "btrfs";
      options = ["subvol=@"];
    };

    "/home" = {
      device = "/dev/mapper/luks-329b2a03-7081-4e91-8599-fae4a3452f18";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5196-6DC3";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
