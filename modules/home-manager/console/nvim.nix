{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    stylua
    alejandra
    rustfmt
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins.lz-n.enable = true;

    globalOpts = {};
    globals = {
      mapleader = " ";
    };

    # withNodeJs = true;
    # withPerl = true;
    # withPython3 = true;
    # withRuby = true;

    opts = {
      termguicolors = true;

      cmdheight = 0;

      fillchars = {eob = " ";};

      number = true;
      relativenumber = true;

      cursorline = true;
      cursorlineopt = "number";
      colorcolumn = "+1";

      scrolloff = 8;

      list = true;
      listchars = "trail:-,tab:▎─╴,nbsp:␣";

      wrap = false;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = false;
      softtabstop = 4;

      textwidth = 79;
      formatoptions = "tco/2qwanvblj";

      smartcase = true;
    };

    plugins = {
      aerial.enable = true;

      bufferline.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "luasnip";}
            {name = "nvim_lsp";}
            {name = "nvim_lsp_signature_help";}
            {name = "path";}
          ];
          mapping = {
            "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<Tab>" = "cmp.mapping.confirm({select = true})";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = ["stylua"];
            nix = ["alejandra"];
            rust = {
              __unkeyed-1 = "rustfmt";
              lsp_format = "fallback";
            };
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };

      dressing.enable = true;

      flash.enable = true;

      friendly-snippets.enable = true;

      gitsigns.enable = true;

      indent-blankline.enable = true;

      lsp = {
        enable = true;
        keymaps.lspBuf = {
          "<Leader>a" = "code_action";
          "<Leader>r" = "rename";
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          html.enable = true;
          jdtls.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          rust_analyzer.enable = true;
          rust_analyzer.installCargo = true;
          rust_analyzer.installRustc = true;
          texlab.enable = true;
          ts_ls.enable = true;
        };
      };

      lspkind.enable = true;

      lualine = {
        enable = true;
        settings.globalstatus = true;
      };

      luasnip.enable = true;

      markdown-preview.enable = true;

      noice = {
        enable = true;
        settings = {
          cmdline.enabled = true;
          messages.enabled = false;
          popupmenu.enabled = true;
          markdown.highlights = {};
          presets.command_palette = true;
        };
      };

      nvim-autopairs.enable = true;

      nvim-surround = {
        settings.keymaps = {
          insert = "<C-g>sa";
          insert_line = "<C-g>sA";
          normal = "gs";
          normal_cur = "gss";
          normal_line = "gS";
          normal_cur_line = "gSS";
          visual = "gs";
          visual_line = "gS";
          delete = "ds";
          change = "cs";
          change_line = "cS";
        };
      };

      nvim-tree = {
        enable = true;
        disableNetrw = true;
        hijackCursor = true;
        hijackUnnamedBufferWhenOpening = true;
        reloadOnBufenter = true;
        syncRootWithCwd = true;
        diagnostics.enable = true;
      };

      render-markdown.enable = true;

      snacks = {
        enable = true;
        settings = {
          bigfile.enabled = true;
          dashboard.enabled = false;
          notifier.enabled = true;
          quickfile.enabled = false;
          statuscolumn.enabled = true;
          words.enabled = false;
          styles.notification.wo.wrap = true;
        };
      };

      telescope.enable = true;

      tmux-navigator = {
        enable = true;
        keymaps = [
          {
            action = "left";
            key = "<C-h>";
          }
          {
            action = "down";
            key = "<C-j>";
          }
          {
            action = "up";
            key = "<C-k>";
          }
          {
            action = "right";
            key = "<C-l>";
          }
          {
            action = "previous";
            key = "<C-\\>";
          }
        ];
      };

      trouble.enable = true;

      treesitter.enable = true;

      treesj.enable = true;

      vimtex = {
        enable = true;
        settings.view_method = "zathura";
      };

      web-devicons.enable = true;

      which-key.enable = true;

      yanky.enable = true;
    };

    keymaps = let
      options = {
        silent = true;
        noremap = true;
      };
    in [
      {
        mode = ["n"];
        key = " ";
        action = "<Nop>";
        inherit options;
      }
      {
        mode = ["i"];
        key = "<C-BS>";
        action = "<C-w>";
        inherit options;
      }
      {
        mode = ["i"];
        key = "<C-h>";
        action = "<C-w>";
        inherit options;
      }
      {
        mode = ["n"];
        key = "H";
        action = "<Cmd>bprevious<CR>";
        inherit options;
      }
      {
        mode = ["n"];
        key = "L";
        action = "<Cmd>bnext<CR>";
        inherit options;
      }
      {
        mode = ["n"];
        key = "<Leader>bd";
        action = "<Cmd>bdelete<CR>";
        inherit options;
      }
      {
        mode = ["n" "t"];
        key = "<C-/>";
        action = "<Cmd>lua Snacks.terminal.toggle()<CR>";
        inherit options;
      }
      {
        mode = ["n" "t"];
        key = "<C-_>";
        action = "<Cmd>lua Snacks.terminal.toggle()<CR>";
        inherit options;
      }
      {
        mode = ["n"];
        key = "<Leader>e";
        action = "<Cmd>NvimTreeToggle<CR>";
        inherit options;
      }
    ];

    clipboard.register = "unnamedplus";

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        term_colors = true;
      };
    };
  };
}
