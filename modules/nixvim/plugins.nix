{ ... }:
{
  programs.nixvim.plugins = {
    aerial = { enable = true; };
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "super-tab";
      };
    };
    bufferline = {
      enable = true; settings.options = {
        buffer_close_icon = "";
      };
    };
    conform-nvim = { enable = true; };
    friendly-snippets = { enable = true; };
    gitsigns = { enable = true; };
    indent-blankline = { enable = true; };
    lazygit = { enable = true; };
    lualine = { enable = true; };
    noice = {
      enable = true;
      settings = {
        presets = {
          bottom_search = false;
          command_palette = true;
          inc_rename = true;
          lsp_doc_border = false;
        };
      };
    };
    nvim-autopairs = { enable = true; };
    nvim-surround = { enable = true; };
    nvim-tree = { enable = true; };
    treesitter = { enable = true; };
    treesj = { enable = true; };
    vimtex = { enable = true; };
    web-devicons = { enable = true; };
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
      };
    };
  };
}
