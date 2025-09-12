require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			hint = {
				enable = true,
			},
		},
	},
})
