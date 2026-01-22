vim.diagnostic.config({
	virtual_text = {
		prefix = ":",
	},
	float = {
		enabled = true,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local function jump_and_show_diagnostic(opts)
	vim.diagnostic.jump(opts)

	vim.defer_fn(function()
		vim.diagnostic.open_float(nil, {
			focus = false,
			scope = "line",
			source = "always",
			border = "rounded",
		})
	end, 0)
end

vim.keymap.set("n", "gd", vim.lsp.buf.type_definition)
vim.keymap.set("n", "ge", function()
	jump_and_show_diagnostic({
		count = 1,
		severity = vim.diagnostic.severity.ERROR,
	})
end)
vim.keymap.set("n", "gpe", function()
	jump_and_show_diagnostic({
		count = -1,
		severity = vim.diagnostic.severity.ERROR,
	})
end)
vim.keymap.set("n", "gne", function()
	jump_and_show_diagnostic({
		count = 1,
		severity = vim.diagnostic.severity.ERROR,
	})
end)
vim.keymap.set("n", "ds", function()
	vim.diagnostic.open_float()
end)
