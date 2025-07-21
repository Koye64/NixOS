{ ... }:
{
  programs.nixvim.lsp.keymaps = [
    { key = "gd";
      lspBufAction = "definition";
    }
    { key = "gD";
      lspBufAction = "references";
    }
    { key = "gt";
      lspBufAction = "type_definition";
    }
    { key = "gi";
      lspBufAction = "implementation";
    }
    { key = "gO";
      lspBufAction = "document_symbol";
    }
    { key = "K";
      lspBufAction = "hover";
    }
    { key = "<leader>r";
      lspBufAction = "rename";
    }
    { key = "<leader>a";
      lspBufAction = "code_action";
    }
    { action = "<CMD>LspStop<Enter>";
      key = "<leader>lx";
    }
    { action = "<CMD>LspStart<Enter>";
      key = "<leader>ls";
    }
    { action = "<CMD>LspRestart<Enter>";
      key = "<leader>lr";
    }
  ];
  programs.nixvim.keymaps = [
    { action = "<CMD>NvimTreeToggle<Enter>";
      key = "<leader>e";
    }
    { action = "<CMD>bnext<Enter>";
      key = "L";
      mode = "n";
    }
    { action = "<CMD>bprev<Enter>";
      key = "H";
      mode = "n";
    }
    { action = "<CMD>bdelete<Enter>";
      key = "<leader>b";
      mode = "n";
    }
    { action = "<CMD>LazyGit<Enter>";
      key = "<leader>g";
      mode = "n";
    }
    { action = "<CMD>MarkdownPreviewToggle<Enter>";
      key = "<leader>p";
    }
    { action = "<CMD>ToggleTerm<Enter>";
      key = "<C-/>";
      mode = [ "n" "i" "v" "s" "t" ];
    }
  ];
  programs.nixvim.plugins.telescope.keymaps = {
    "<leader>f" = {
      action = "find_files";
      options = {
        desc = "Telescope find files";
      };
    };
  };
}
