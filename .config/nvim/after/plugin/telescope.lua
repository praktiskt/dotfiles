local builtin = require('telescope.builtin')

vim.api.nvim_create_user_command("Emoji", require('telescope.builtin').symbols, {})

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', function() builtin.grep_string() end)
vim.keymap.set('n', '<leader>ff', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "target/debug"
        }
    }
})
