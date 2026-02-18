require("autoclose").setup({
	options = {
		disabled_filetypes = { "text", "markdown" },
	},
	keys = {
		[">"] = { escape = false, close = false, pair = "<>", disabled_filetypes = {} },
		["`"] = { escape = false, close = false, pair = "``", disabled_filetypes = {} },
	},
})
