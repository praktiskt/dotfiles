local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "Close tree when entering a file",
	callback = function()
		vim.cmd(":silent NvimTreeClose")
	end,
	group = autocmd_group,
})

-- autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml set ft=helm
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*/templates/*.yaml", "*/templates/*.tpl", "*.gotmpl", "helmfile*.yaml" },
	desc = "Set ft=helm for Helm files",
	callback = function()
        vim.cmd(":silent set ft=helm")
	end,
	group = autocmd_group,
})
