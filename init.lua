local Core = {
	-- Core
	options = "simple.Core.options",
	keymaps = "simple.Core.keymaps",
	plugins = "simple.Core.plugins",
	cursor = "simple.Core.cursor",
}
local Configs = {
	-- Configs
	FileExplorer = "simple.Configs.FileExplorer",
	BufferLine = "simple.Configs.BufferLine",
	LuaLine = "simple.Configs.LuaLine",
	Terminal = "simple.Configs.Terminal",
	Project = "simple.Configs.Project",
	Impatient = "simple.Configs.Impatient",
	IndentLine = "simple.Configs.IndentLine",
  Alpha = "simple.Configs.Alpha",
	WhichKey = "simple.Configs.WhichKey",
	CMP = "simple.Configs.CMP",
	LSP = "simple.Configs.LSP",
	Telescope = "simple.Configs.Telescope",
	Colorizer = "simple.Configs.Colorizer",
	Notification = "simple.Configs.Notification",
	Treesitter = "simple.Configs.Treesitter",
	Comments = "simple.Configs.Comments",
	Autopairs = "simple.Configs.Autopairs",
	Gitsigns = "simple.Configs.Gitsigns",
	SymbolsOutline = "simple.Configs.SymbolsOutline",
	DAP = "simple.Configs.DAP",
	LazyGit = "simple.Configs.LazyGit",
  Neorg = "simple.Configs.Neorg",
  BufDel = "simple.Configs.BufDel",
  Focus = "simple.Configs.Focus"
}

for k, v in pairs(Core) do
	require(v)
end

for k, v in pairs(Configs) do
	require(v)
end
