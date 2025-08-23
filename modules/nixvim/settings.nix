{ ... }:
{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    opts = {
      colorcolumn = "80";
      conceallevel = 2;
      confirm = true;
      cursorline = true;
      expandtab = true;
      fillchars.eob = " ";
      fo = "crqwanvblj";
      list = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      scrolloff = 4;
      shiftround = true;
      shiftwidth = 2;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      spelllang = [ "en" ];
      tabstop = 2;
      termguicolors = true;
      undofile = true;
      undolevels = 10000;
      wrap = false;
    };
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
      markdown_recommended_style = 0;
    };
  };
}
