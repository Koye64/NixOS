{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/console.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/nixvim.nix
  ];
}
