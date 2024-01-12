vim.g.mapleader = " "
vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-f>", "/")

-- Allow moving lines in visual mode
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")

-- Keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")
vim.keymap.set("n", "<leader><leader>", "zz")

-- Replace currently marked selection with buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Allow yanking into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- In vertical edit mode, allow ctrl+c to paste
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Substitute the word we're on-macro
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- File tree config
vim.keymap.set("n", "<leader>te", ":NvimTreeOpen<CR>")
vim.keymap.set("v", "<leader>te", ":NvimTreeOpen<CR>")

-- Visual multi select
local binds = {}
binds["Find Under"] = "<C-d>"
binds["Find Subword Under"] = "<C-d>"
vim.g.VM_maps = binds
vim.g.VM_theme = "nord"

-- Trouble
vim.keymap.set("n", "<leader>td", "<esc>:TroubleToggle<CR>")
vim.keymap.set("v", "<leader>td", "<esc>:TroubleToggle<CR>")

-- Which key
vim.keymap.set("n", "<leader>h", "<esc>:WhichKey<CR>")
vim.keymap.set("v", "<leader>h", "<esc>:WhichKey<CR>")

-- Tabby
vim.g.tabby_trigger_mode = 'manual'
vim.g.tabby_keybinding_accept = '<Tab>'
vim.g.tabby_keybinding_trigger_or_dismiss = '<C-a>'

