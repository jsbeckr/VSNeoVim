function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {"NvimTree"},
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  -- color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  'branch',
  icon = '',
  -- color = { fg = colors.magenta, gui = 'bold' },
}

ins_left {
  'diagnostics',
  symbols = { error = ' ', warn = ' ', info = ' ' },
  sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint"},
	update_in_insert = false,
	always_visible = true,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  -- color= { fg = colors.magenta },
}

ins_left {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
  color = {
    -- fg = colors.blue,
  }
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2

ins_left {
  function()
    return '%='
  end,
}

ins_left {
   function(msg)
    msg = msg or "LS Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    return table.concat(buf_client_names, ", ")
  end,
  -- icon = " ",
  icon = "  ",
  -- color = { gui = "bold", fg= colors.green},
}

ins_right {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
    if venv then
      return string.format("  (%s)", env_cleanup(venv))
    end
    venv = os.getenv "VIRTUAL_ENV"
    if venv then
      return string.format("  (%s)", env_cleanup(venv))
    end
    return ""
  end
  return ""
  end,
  -- color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

-- Add components to right sections
ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    -- added = { fg = colors.green },
    -- modified = { fg = colors.orange },
    -- removed = { fg = colors.red },
  },
}

-- ins_right { 'location',  color = { fg = colors.yellow, gui = 'bold' } }
ins_right { 'location' }

ins_right {
  'filetype',
  icons_enabled = true,
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  -- color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  -- color = { fg = colors.green, gui = 'bold' },
}


ins_right {
  function()
        local current_line = vim.fn.line "."
        local total_lines = vim.fn.line "$"
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end,
      padding = { left = 0, right = 0 },
      -- color = { fg = colors.yellow, bg = colors.bg },
      cond = nil,
  }

-- Now don't forget to initialize lualine
require("lualine").setup(config)
