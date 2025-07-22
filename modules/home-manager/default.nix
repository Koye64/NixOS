{ ... }:
{
  imports = [
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./git.nix
    ./hyprland.nix
    ./nixvim.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
