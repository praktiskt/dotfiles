local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "Close tree when entering a file",
	callback = function()
		vim.cmd(":silent NvimTreeClose")
	end,
	group = autocmd_group,
})
