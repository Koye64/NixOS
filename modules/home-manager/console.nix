{ inputs, pkgs, lib, config, ... }:
{
  home.sessionVariables = {
    PAGER = "${lib.getExe config.programs.bat.package}";
    fish_greeting = "";
  };
  home.shellAliases = {
    lg = "${lib.getExe config.programs.lazygit.package}";
    cat = "${lib.getExe config.programs.bat.package}";
    man = "${lib.getExe pkgs.bat-extras.batman}";
  };
  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    btop = { enable = true; };
    cava = { enable = true; };
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
      preferAbbrs = false;
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
    lazygit = {
      enable = true;
      settings = {
        disableStartupPopups = true;
      };
    };
    nh = {
      enable = true;
      flake = "/home/koye/NixOS";
    };
    starship = {
      enable = true;
      enableTransience = true;
    };
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
