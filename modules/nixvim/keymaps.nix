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
  ];
}
