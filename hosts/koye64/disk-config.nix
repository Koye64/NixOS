{ lib, inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
  ];
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              priority = 1;
              name = "ESP";
              size = "1M";
              type = "EF02";
            };
            persist = {
              priority = 2;
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/@" = {
                    mountpoint = "/";
                  };
                  "/@boot" = {
                    mountpoint = "/boot";
                  };
                  "/@persist" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/persist";
                  };
                  "/@home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  "/@srv_syncthing" = {
                    mountOptions = [
                      "compress=zstd"
                      "X-mount.owner=koye"
                    ];
                    mountpoint = "/srv/syncthing";
                  };
                  "/@srv_www_koye64.com" = {
                    mountOptions = [
                      "compress=zstd"
                      "X-mount.owner=koye"
                    ];
                    mountpoint = "/srv/www/koye64.com";
                  };
                  "/@nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                  "/@.swap" = {
                    mountpoint = "/.swap";
                    swap = {
                      swapfile.size = "2G";
                    };
                  };
                };
                mountpoint = "/btrfs_root";
              };
            };
          };
        };
      };
    };
  };
  fileSystems."/boot".neededForBoot = true;
  fileSystems."/persist".neededForBoot = true;
  boot.initrd.postResumeCommands = lib.mkAfter ''
    echo "Mounting temporary btrfs root..."
    mkdir /btrfs_tmp
    mount /dev/sda2 /btrfs_tmp
    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
    }
    echo "Deleting old root..."
    delete_subvolume_recursively /btrfs_tmp/@
    echo "Creating new root..."
    btrfs subvolume create /btrfs_tmp/@
    echo "Unmounting temporary btrfs root..."
    umount /btrfs_tmp
    rm -r /btrfs_tmp
  '';
}
