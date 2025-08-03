{ inputs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./greeter.nix
    ./hyprland.nix
    ./impermanence.nix
    ./nix.nix
    ./home-manager.nix
  ];
}
