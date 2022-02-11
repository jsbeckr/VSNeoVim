local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "simple.Configs.LSP.lsp-installer"
require("simple.Configs.LSP.handlers").setup()
require "simple.Configs.LSP.null-ls"
