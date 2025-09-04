{ ... }:
{
  programs.nixvim.plugins.lspconfig.enable = true;
  programs.nixvim.lsp.inlayHints.enable = true;
  programs.nixvim.lsp.servers = {
    bashls = {
      enable = true;
    };
    clangd = {
      enable = true;
    };
    fish_lsp = {
      enable = true;
    };
    lua_ls = {
      enable = true;
    };
    nixd = {
      enable = true;
    };
    rust_analyzer = {
      enable = true;
    };
    texlab = {
      enable = true;
    };
    tinymist = {
      enable = true;
    };
    ts_ls = {
      enable = true;
    };
  };
}
