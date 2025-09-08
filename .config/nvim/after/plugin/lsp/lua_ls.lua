require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = {
				enable = true,
			},
		},
	},
})
