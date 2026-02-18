vim.lsp.config("pyrefly", {
	settings = {
		pyrefly = {
			analyzer = true,
			typechecking = "strict",
			diagnostics = true,
		},
	},
})
