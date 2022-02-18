local OPTIONS = vim.opt
local GLOBAL = vim.g

local optionsconfig = {
  backup = false,
  clipboard = 'unnamedplus',
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = 'utf-8',
  hlsearch = true,
  ignorecase = true,
  mouse = 'a',
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = 'yes',
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  background = 'dark',
  termguicolors = true
}

-- for k, v in pairs(globalconfig) do
--   GLOBAL[k] = v
-- end
for k, v in pairs(optionsconfig) do
  OPTIONS[k] = v
end

vim.cmd "colorscheme ayu"
vim.cmd "set whichwrap+=<,>,[,],h,l"
