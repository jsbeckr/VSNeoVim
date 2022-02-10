local VisualStudioNeovim = {
  -- Core
  options = "VisualStudioNeovim.Core.options",
  keymaps = "VisualStudioNeovim.Core.keymaps",
  plugins = "VisualStudioNeovim.Core.plugins",
  cursor = "VisualStudioNeovim.Core.cursor",
}
local Configs = {
  -- Configs
  FileExplorer = "VisualStudioNeovim.Configs.FileExplorer",
  BufferLine = "VisualStudioNeovim.Configs.BufferLine",
  LuaLine = "VisualStudioNeovim.Configs.LuaLine",
  Terminal = "VisualStudioNeovim.Configs.Terminal",
  Project = "VisualStudioNeovim.Configs.Project",
  Impatient = "VisualStudioNeovim.Configs.Impatient",
  IndentLine = "VisualStudioNeovim.Configs.IndentLine",
  Alpha = "VisualStudioNeovim.Configs.Alpha",
  WhichKey = "VisualStudioNeovim.Configs.WhichKey",
  CMP = "VisualStudioNeovim.Configs.CMP",
  LSP = "VisualStudioNeovim.Configs.LSP",
  Tlescope = "VisualStudioNeovim.Configs.Telescope",
  Colorizer = "VisualStudioNeovim.Configs.Colorizer",
  Notification = "VisualStudioNeovim.Configs.Notification",
  Treesitter = "VisualStudioNeovim.Configs.Treesitter",
  Comments = "VisualStudioNeovim.Configs.Comments",
  Autopairs = "VisualStudioNeovim.Configs.Autopairs",
  Gitsigns = "VisualStudioNeovim.Configs.Gitsigns",
  SymbolsOutline = "VisualStudioNeovim.Configs.SymbolsOutline",
  DAP = "VisualStudioNeovim.Configs.DAP",
  LazyGit = "VisualStudioNeovim.Configs.LazyGit",
}

for k, v in pairs(VisualStudioNeovim) do
  require(v)
end
for k, v in pairs(Configs) do
  require(v)
end
