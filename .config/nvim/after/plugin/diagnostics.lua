vim.diagnostic.config({
	virtual_text = {
		prefix = ":",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "gne", function()
	vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "ge", function()
	vim.diagnostic.goto_next()
end, opts)
vim.keymap.set("n", "gpe", function()
	vim.diagnostic.goto_prev()
end, opts)
