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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf ---@type number
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
			end, { buffer = bufnr })
		end
	end,
})
