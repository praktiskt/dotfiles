vim.g.mapleader = " "
vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")
vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>i")
vim.keymap.set({"n", "v"}, "<S-Up>", "<Up>")
vim.keymap.set({"n", "v"}, "<S-Down>", "<Down>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i")

-- Spelling shortcuts
vim.keymap.set("n", "<leader>sn", "]s") -- next misspell
vim.keymap.set("n", "<leader>sb", "[s") -- previous misspell
vim.keymap.set("n", "<leader>sa", "zg") -- add to dictionary
vim.keymap.set("n", "<leader>sf", "z=") -- open spelling fix

-- Allow moving lines in visual mode
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")
vim.keymap.set("n", "<leader><leader>", "zz")

-- Replace currently marked selection with buffer
vim.keymap.set("n", "<leader>p", "\"_dP")
vim.keymap.set("v", "<leader>p", "\"_dP")

-- Allow yanking into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y")

-- In vertical edit mode, allow ctrl+c to paste
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Substitute the word we're on-macro
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>cs", '"zy<Esc>:%s/<C-R>z//g<Left><Left>')

-- File tree config
vim.keymap.set("n", "<leader>te", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "te", ":NvimTreeOpen<CR>")

-- Visual multi select
vim.g.VM_default_mappings = 0
local binds = {}
binds["Find Under"] = "<C-d>"
binds["Find Subword Under"] = "<C-d>"
binds["Select Cursor Up"] = '<C-Up>'
binds["Select Cursor Down"] = '<C-Down>'
vim.g.VM_maps = binds
vim.g.VM_theme = "nord"

-- Trouble
vim.keymap.set("n", "<leader>td", "<esc>:TroubleToggle<CR>")
vim.keymap.set("n", "td", "<esc>:TroubleToggle<CR>")

-- Which key
vim.keymap.set("n", "<leader>h", "<esc>:WhichKey<CR>")

-- Tabby
vim.g.tabby_trigger_mode = 'manual'
vim.g.tabby_keybinding_accept = '<Tab>'
vim.g.tabby_keybinding_trigger_or_dismiss = '<C-a>'

-- LSP
vim.keymap.set({"n", "v"}, '<leader>qf', ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

