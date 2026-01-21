vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")
vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>i<Right>")
vim.keymap.set({ "n" }, "<C-n>", "<Cmd>enew<CR>")
vim.keymap.set({ "n", "s" }, "<C-k>s", "<Cmd>noautocmd w<CR>")
vim.keymap.set({ "n", "v" }, "<S-Up>", "<Up>")
vim.keymap.set({ "n", "v" }, "<S-Down>", "<Down>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N><<<C-\\><C-N>^i")
vim.keymap.set("i", "<A-BS>", "<Esc>ciw")
vim.keymap.set("n", "<A-Right>", "e")
vim.keymap.set("n", "<A-Left>", "b")
vim.keymap.set("n", "<A-q>", "<Cmd>bdelete<CR>")
vim.keymap.set("t", "<A-q>", "<Cmd>silent! bdelete!<CR>", { silent = true })

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

-- Allow visual select with Shift
vim.keymap.set("n", "<S-up>", "vk")
vim.keymap.set("n", "<S-down>", "vj")
vim.keymap.set("n", "<S-right>", "vl")
vim.keymap.set("n", "<S-left>", "vh")

-- Keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")
vim.keymap.set("n", "<leader><leader>", "zz")

-- Replace currently marked selection with buffer
vim.keymap.set("n", "<leader>p", '"_dP')
vim.keymap.set("v", "<leader>p", '"_dP')

-- Le yanks
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y')
vim.keymap.set("v", "<C-S-c>", '"+y')

-- Substitute the word we're on-macro
vim.keymap.set("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>cs", '"zy<Esc>:%s/<C-R>z//g<Left><Left>')

-- LSP
vim.keymap.set({ "n", "v" }, "<leader>qf", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-Space>", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
