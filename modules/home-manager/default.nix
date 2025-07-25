{ ... }:
{
  imports = [
    ./hyprland
    ./waybar
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./fonts.nix
    ./git.nix
    ./graphicalToolkit.nix
    ./nixvim.nix
  ];
  xdg.configFile."nixpkgs/config.nix".source = ../nixos/nixpkgs-config.nix;
  home.stateVersion = "25.05";
}
