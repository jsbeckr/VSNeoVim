local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("simple.Configs.LSP.handlers").on_attach,
		capabilities = require("simple.Configs.LSP.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("simple.Configs.LSP.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("simple.Configs.LSP.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tsserver" then
		local nvim_lsp_ts_utils_opts = {
			init_options = require("nvim-lsp-ts-utils").init_options,
			on_attach = function(client, bufnr)
				local ts_utils = require("nvim-lsp-ts-utils")

				-- defaults
				ts_utils.setup({
					debug = true,
					disable_commands = false,
					enable_import_on_completion = false,

					-- import all
					import_all_timeout = 5000, -- ms
					-- lower numbers = higher priority
					import_all_priorities = {
						same_file = 1, -- add to existing import statement
						local_files = 2, -- git files or files with relative path markers
						buffer_content = 3, -- loaded buffer content
						buffers = 4, -- loaded buffer names
					},
					import_all_scan_buffers = 100,
					import_all_select_source = false,
					-- if false will avoid organizing imports
					always_organize_imports = true,

					-- filter diagnostics
					filter_out_diagnostics_by_severity = {},
					filter_out_diagnostics_by_code = {},

					-- inlay hints
					auto_inlay_hints = true,
					inlay_hints_highlight = "Comment",
					inlay_hints_priority = 200, -- priority of the hint extmarks
					inlay_hints_throttle = 150, -- throttle the inlay hint request
					inlay_hints_format = { -- format options for individual hint kind
						Type = {},
						Parameter = {},
						Enum = {},
						-- Example format customization for `Type` kind:
						-- Type = {
						--     highlight = "Comment",
						--     text = function(text)
						--         return "->" .. text:sub(2)
						--     end,
						-- },
					},

					-- update imports on file move
					update_imports_on_move = false,
					require_confirmation_on_move = false,
					watch_dir = nil,
				})

				-- required to fix code action ranges and filter diagnostics
				ts_utils.setup_client(client)
        require("simple.Configs.LSP.handlers").on_attach(client, bufnr)
			end,
		}
		opts = vim.tbl_deep_extend("keep", nvim_lsp_ts_utils_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
