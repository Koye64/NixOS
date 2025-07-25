{ ... }:
{
  imports = [
    ./hyprland
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./git.nix
    ./graphicalToolkit.nix
    ./nixvim.nix
    ./waybar.nix
  ];

  xdg.configFile."nixpkgs/config.nix".source = ../nixos/nixpkgs-config.nix;
  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
