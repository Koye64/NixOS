{ ... }:
{
  imports = [
    ./keymaps.nix
    ./lsp.nix
    ./plugins.nix
    ./settings.nix
  ];

  programs.nixvim = {
    enableMan = true;
    defaultEditor = true;
    vimAlias = true;
    withNodeJs = true;
    withPerl = true;
    withPython3 = true;
    withRuby = true;
    colorschemes.catppuccin.enable = true;
  };
}
