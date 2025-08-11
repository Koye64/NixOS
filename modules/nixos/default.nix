{ inputs, ... }:
{
  imports = [
    ./catppuccin.nix
    ./console.nix
    ./desktop.nix
    ./greeter.nix
    ./home-manager.nix
    ./hyprland.nix
    ./impermanence.nix
    ./nix.nix
    ./vr.nix
  ];
}
