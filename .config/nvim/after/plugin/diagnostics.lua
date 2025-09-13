vim.diagnostic.config({
	virtual_text = {
		prefix = ":",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gne", vim.diagnostic.jump)
vim.keymap.set("n", "ge", vim.diagnostic.jump)
vim.keymap.set("n", "gpe", vim.diagnostic.goto_prev)
