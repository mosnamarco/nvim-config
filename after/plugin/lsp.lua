local lsp_zero = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"html",
		"cssls",
		"eslint",
	},
	handlers = {
		lsp_zero.default_setup,

		lua_ls = function()
			lsp_config.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})
		end,
	}
})
