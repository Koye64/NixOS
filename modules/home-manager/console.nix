{ inputs, pkgs, lib, config, ... }:
{
  home.shellAliases = {
    lg = "${lib.getExe config.programs.lazygit.package}";
  };
  programs = {
    bat = {
      enable = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "auto";
    };
    fastfetch = {
      enable = true;
      settings = { };
    };
    fish = {
      enable = true;
    };
    hyfetch = {
      enable = true;
      settings = {
        preset = "pansexual";
        mode = "rgb";
        light_dark = "dark";
        lightness = 0.65;
        backend = "fastfetch";
        color_align.mode = "horizontal";
      };
    };
    kitty = {
      enable = true;
    };
    lazygit = { enable = true; };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
    nh = {
      enable = true;
      flake = "/home/koye/NixOS";
    };
    starship = {
      enable = true;
      enableTransience = true;
      settings = {
        add_newline = false;
      };
    };
    vim = { enable = true; };
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
