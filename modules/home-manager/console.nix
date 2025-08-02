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
    c = "clear";
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
    cava = {
      enable = true;
      settings = {
        general.framerate = 144;
        smoothing.noise_reduction = 12;
      };
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
      settings = import ../shared/starship.nix;
    };
    yazi = { enable = true; };
    zsh = {
      enable = true;
      enableVteIntegration = true;
      autocd = true;
      autosuggestion = {
        enable = true;
        strategy = [
          "history"
          "completion"
          "match_prev_cmd"
        ];
      };
      completionInit = ''
        zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
        zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
        zstyle ':completion:*' max-errors 3
        zstyle :compinstall filename '/home/koye/compinstall'
        autoload -Uz compinit
        compinit
      '';
      syntaxHighlighting.enable = true;
    };
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
