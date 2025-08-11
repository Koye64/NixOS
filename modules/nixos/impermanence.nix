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
      "/var/lib/syncthing"
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
        ".config/wivrn"
        ".local/share/keyrings"
        ".local/share/Steam"
        ".local/share/zoxide"
        ".mozilla/firefox"
        ".ssh"
      ];
      files = [
        ".zsh_history"
      ];
    };
  };
}
