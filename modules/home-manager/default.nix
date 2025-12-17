{lib, ...}: {
  imports = [
    ./niri
    ./shell
    ./desktop/firefox.nix
    ./desktop/wm.nix
    ./catppuccin.nix
    ./font.nix
  ];

  shell.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  wm.enable = lib.mkDefault true;
}
