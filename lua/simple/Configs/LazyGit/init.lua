local GLOBAL = vim.g

local configs = {
  lazygit_use_neovim_remote = 1,
  lazygit_floating_window_use_plenary = 0,
  lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'},
  lazygit_floating_window_scaling_factor = 0.9,
  lazygit_floating_window_winblend = 0,
}

for k, v in pairs(configs) do
  GLOBAL[k] = v
end
