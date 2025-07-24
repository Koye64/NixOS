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

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
