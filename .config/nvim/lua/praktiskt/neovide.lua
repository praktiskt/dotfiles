if vim.g.neovide then
	vim.keymap.set("v", "<C-S-c>", '"+y')
	vim.keymap.set({ "i", "n", "v" }, "<C-S-v>", '"+P')
	vim.keymap.set("c", "<C-S-v>", "<C-R>+")
	vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli')

	vim.api.nvim_set_keymap("", "<C-S-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })

	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_scroll_animation_far_lines = 2
	vim.g.neovide_scroll_animation_length = 0.00
end
