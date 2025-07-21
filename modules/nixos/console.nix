{ pkgs, ... }:
{
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
    fish = { enable = true; };
    git = {
      enable = true;
      lfs.enable = true;
    };
    lazygit = { enable = true; };
    starship = {
      enable = true;
      transientPrompt = { enable = true; };
      settings = {
        add_newline = false;
      };
    };
    vim = { enable = true; };
    zoxide = {
      enable = true;
      flags = [
        "--cmd cd"
      ];
    };
  };
  users.defaultUserShell = pkgs.fish;
}
