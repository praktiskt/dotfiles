-- Configure neovide

-- Speed up animations
vim.g.neovide_cursor_animation_length = 0.02
vim.g.neovide_scroll_animation_length = 0.05

-- Paste from system clipboard
vim.keymap.set({"i"}, "<C-S-v>", "<esc>\"+pi")
