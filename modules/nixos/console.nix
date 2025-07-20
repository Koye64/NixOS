{ pkgs, ... }:
{
  programs = {
    bat = { enable = true; };
    fish = { enable = true; };
    git = {
      enable = true;
      lfs.enable = true;
    };
    lazygit = { enable = true; };
    neovim = {
      enable = true;
      defaultEditor = true;
      withRuby = true;
      withPython3 = true;
      withNodeJs = true;
      vimAlias = true;
    };
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
