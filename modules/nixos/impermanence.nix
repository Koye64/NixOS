{ inputs, ... }:
{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  programs.fuse.userAllowOther = true;
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
    users.koye = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        "NixOS"
        ".gnupg"
        ".nixops"
        ".ssh"
        ".local/share/keyrings"
        ".local/share/direnv"
        ".local/share/Steam"
        ".mozilla/firefox"
      ];
    };
  };
}
