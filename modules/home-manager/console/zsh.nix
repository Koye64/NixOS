{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    
    history = {
      append = true;
      expireDuplicatesFirst = true;
    };

    syntaxHighlighting = {
      enable = true;
    };
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };

  programs.eza = {
    enable = true;
    icons = "auto";
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };
}
