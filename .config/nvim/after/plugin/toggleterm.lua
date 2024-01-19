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
    shade_terminals = true
})

function _Toggle_floating_terminal() floating_terminal:toggle() end
function _Toggle_horizontal_terminal() horizontal_terminal:toggle() end

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _Toggle_floating_terminal()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _Toggle_horizontal_terminal()<CR>", {noremap = true, silent = true})
