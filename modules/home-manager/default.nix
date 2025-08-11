{ ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./desktop
    ./catppuccin.nix
    ./console.nix
    ./fonts.nix
    ./git.nix
    ./graphicalToolkit.nix
    ./nixvim.nix
    ./syncthing.nix
    ./vimtex.nix
  ];
  xdg.configFile."nixpkgs/config.nix".source = ../nixos/nixpkgs-config.nix;
}
