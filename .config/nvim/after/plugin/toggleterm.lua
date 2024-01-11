vim.keymap.set("n", "<leader>tt", "<esc>:ToggleTerm<CR>")
vim.keymap.set("v", "<leader>tt", "<esc>:ToggleTerm<CR>")

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local floating_terminal = Terminal:new({
    direction = "float",
    shade_terminals = true,
})
local horizontal_terminal= Terminal:new({
    direction = "horizontal",
    shade_terminals = true
})

function _Toggle_floating_terminal() floating_terminal:toggle() end
function _Toggle_horizontal_terminal() horizontal_terminal:toggle() end

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _Toggle_floating_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>tf", "<cmd>lua _Toggle_floating_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>tt", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
