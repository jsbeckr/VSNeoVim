local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspconfig.gdscript.setup({
  on_attach = require("simple.Configs.LSP.handlers").on_attach,
  flags = {
    debounce_text_changes = 300
  }
})

require "simple.Configs.LSP.lsp-installer"
require("simple.Configs.LSP.handlers").setup()
require "simple.Configs.LSP.null-ls"

