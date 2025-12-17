{lib, ...}: {
  imports = [
    ./niri
    ./shell
    ./desktop/firefox.nix
    ./catppuccin.nix
    ./font.nix
  ];

  shell.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
}
