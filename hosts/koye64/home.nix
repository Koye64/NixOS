{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/catppuccin.nix
    ../../modules/home-manager/console.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/nixvim.nix
  ];
  xdg.configFile."nixpkgs/config.nix".source = ../../modules/nixos/nixpkgs-config.nix;
  home.stateVersion = "25.05";
}
