{ pkgs, ... }:

{
  home.file.".p10k.zsh" = {
    enable = true;
    executable = true;
    source = ./p10k.zsh;
    target = ".p10k.zsh";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;

    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
    initExtra = ''[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh'';

    plugins = [
      {
        name = "powerlevel10k";
	file = "powerlevel10k.zsh-theme";
	src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
      }
    ];
    
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
