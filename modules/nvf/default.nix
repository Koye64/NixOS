{...}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
    };

    undoFile.enable = true;

    options = {
      shiftwidth = 2;
      tabstop = 8;
      scrolloff = 8;
      smartindent = true;
      linebreak = true;
      wrap = false;
      cursorline = true;
      colorcolumn = "80";
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        desc = "Open parent directory";
      }
      {
        mode = ["n" "t"];
        key = "<C-/>";
        action = "<CMD>ToggleTerm<CR>";
        desc = "ToggleTerm";
      }
    ];

    spellcheck = {
      enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;

      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      json.enable = true;
      kotlin.enable = true;
      ts.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = true;
      python.enable = true;
      typst.enable = true;
      rust.enable = true;
    };

    visuals = {
      nvim-cursorline.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      setupOpts = {
        cmdline.keymap.preset = "default";
        keymap.preset = "default";
      };
    };
    snippets.luasnip.enable = true;

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
    };

    minimap.codewindow.enable = true;

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };

    mini.move.enable = true;
    utility = {
      oil-nvim = {
        enable = true;
        gitStatus.enable = true;
      };
    };

    ui = {
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          nix = "110";
        };
      };
    };
  };
}
