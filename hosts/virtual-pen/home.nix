{ pkgs, ... }:

{
  imports = [ ../../modules/home-manager ];

  # User-defined modules
  niri.enable = true;

  color-scheme.enable = true;

  font.enable = true;

  home.username = "koye";
  home.homeDirectory = "/home/koye";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    clang-tools
    luajitPackages.lua-lsp
    nil
    rust-analyzer
    texlab
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      catppuccin-nvim
      gitsigns-nvim
      indent-blankline-nvim
      mini-move
      nvim-lspconfig
      oil-nvim
      toggleterm-nvim
      treesj
      typst-preview-nvim
      vimtex
    ];
    extraLuaConfig = ''
      vim.cmd.colorscheme('catppuccin')

      require('blink.cmp').setup()
      require('catppuccin').setup()
      require('ibl').setup()
      require('mini.move').setup()
      require('oil').setup()
      require('toggleterm').setup()
      require('treesj').setup()
      require('typst-preview').setup()

      vim.g.vimtex_view_method = 'zathura'
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set({"n", "t"}, "<C-/>", "<CMD>ToggleTerm<CR>", { desc = "Toggle ToggleTerm" })

      vim.lsp.enable('bashls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('nil_ls')
      vim.lsp.enable('rust_analyzer')
      vim.lsp.enable('texlab')
    '';
  };
  programs.alacritty = {
    enable = true;
  };
  programs.bash = {
    enable = true;
  };
  programs.git = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
  };
}
