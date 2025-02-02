{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
