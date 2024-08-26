-- Configure neovide
if vim.g.neovide then
	-- Cosmetics
	vim.g.neovide_cursor_animation_length = 0.02
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_scroll_animation_length = 0.05
	vim.g.neovide_scale_factor = 0.75

	-- Paste from system clipboard
	vim.keymap.set({ "i" }, "<C-S-v>", '<esc>"+Pi') -- insert
	vim.keymap.set({ "c" }, "<C-S-v>", "<C-R>+") -- command
end
