local builtin = require("telescope.builtin")
vim.api.nvim_create_user_command("Emoji", require("telescope.builtin").symbols, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string()
end)

vim.keymap.set("n", "tg", builtin.git_status)
vim.keymap.set("n", "<leader>tg", builtin.git_status)

vim.keymap.set("n", "<leader>fr", builtin.lsp_references)

vim.keymap.set("n", "<leader>ff", builtin.live_grep)
vim.keymap.set("n", "<C-S-f>", builtin.live_grep)

vim.keymap.set("v", "<leader>fs", function()
	vim.cmd('noau normal! "vy')
	local text = vim.fn.getreg("v")
	builtin.live_grep({ default_text = text })
end, { desc = "Telescope live_grep with visual selection" })

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"target/debug",
			".venv",
		},
	},
})
