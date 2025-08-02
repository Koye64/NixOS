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
      settings = import ../shared/starship.nix;
    };
    vim = { enable = true; };
    zsh = {
      enable = true;
      autosuggestions = {
        enable = true;
        strategy = [
          "history"
          "completion"
          "match_prev_cmd"
        ];
      };
      enableBashCompletion = true;
      enableLsColors = true;
      vteIntegration = true;
      syntaxHighlighting.enable = true;
    };
    zoxide = {
      enable = true;
      flags = [
        "--cmd cd"
      ];
    };
  };
  users.defaultUserShell = pkgs.zsh;
}
