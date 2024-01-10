vim.g.mapleader = " "
vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
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

-- In vertical edit mode, allow ctrl+c to paste
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Substitute the word we're on-macro
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Multi-select
---- Rebind C-n to C-d
local binds = {}
binds["Find Under"] = "<C-d>"
binds["Find Subword Under"] = "<C-d>"
vim.g.VM_maps = binds

-- File tree config
vim.keymap.set("n", "<leader>e", "<esc>:NvimTreeToggle<CR>")
vim.keymap.set("v", "<leader>e", "<esc>:NvimTreeToggle<CR>")

-- Terminal shortcuts
vim.keymap.set('n', '<leader>t', "<esc>:ToggleTerm<CR>")
vim.keymap.set('v', '<leader>t', "<esc>:ToggleTerm<CR>")

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

