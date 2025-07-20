{ inputs, ... }:
{
  imports = [ inputs.impermanence.homeManagerModules.impermanence ];

  home.persistence."/persist/home/koye" = {
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
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    allowOther = true;
  };
}
