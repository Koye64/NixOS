{ inputs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./hyprland.nix
    ./impermanence.nix
    ./nix.nix
    ./nixvim.nix
    ./home-manager.nix
  ];
}
