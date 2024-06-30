function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
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
    shade_terminals = false,
})

function _Toggle_floating_terminal() floating_terminal:toggle() end
function _Toggle_horizontal_terminal() horizontal_terminal:toggle() end

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _Toggle_floating_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})

if vim.g.neovide then
    vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("i", "<A-1>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-1>", "<cmd>lua _Toggle_horizontal_terminal()<CR>A", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("i", "<A-2>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-2>", "<cmd>lua _Toggle_horizontal_terminal()<CR>A", {noremap = true, silent = true})
    -- TODO: Alt+t, is it nice?
    vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("i", "<A-t>", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("t", "<A-t>", "<cmd>lua _Toggle_horizontal_terminal()<CR>A", {noremap = true, silent = true})
end
