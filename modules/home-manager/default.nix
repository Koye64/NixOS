{ inputs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./console.nix
    ./git.nix
    ./hyprland.nix
    ./impermanence.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
