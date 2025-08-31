{ pkgs, ... }:
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
        always_show_bufferline = false;
        buffer_close_icon = "";
        close_icon = "";
      };
    };
    conform-nvim = { enable = true; };
    friendly-snippets = { enable = true; };
    gitsigns = { enable = true; };
    indent-blankline = { enable = true; };
    lazygit = { enable = true; };
    lualine = {
      enable = true;
      settings.options = {
        globalstatus = true;
      };
    };
    markdown-preview = { enable = true; };
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
    nvim-tree = {
      enable = true;
      openOnSetup = true;
      openOnSetupFile = true;
      settings = {
        disable_netrw = true;
        hijack_cursor = true;
        hijack_netrw = true;
        hijack_unnamed_buffer_when_opening = true;
        sync_root_with_cwd = true;
        actions.change_dir.enable = true;
        modified = { enable = true; };
        tab.sync = {
          close = true;
          open = true;
        };
        update_focused_file = {
          enable = true;
          update_root = true;
        };
      };
    };
    render-markdown = { enable = true; };
    telescope = { enable = true; };
    tmux-navigator = { enable = true; };
    toggleterm = { enable = true; };
    treesitter = { enable = true; };
    treesj = { enable = true; };
    web-devicons = { enable = true; };
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
      };
    };
  };
}
