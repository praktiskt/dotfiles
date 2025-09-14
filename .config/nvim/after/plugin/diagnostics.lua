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
vim.keymap.set("n", "gne", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "ge", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "gpe", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end)
