local actions = require("diffview.actions")
require("diffview").setup({
	keymaps = {
		file_panel = {
			["<A-CR>"] = actions.goto_file_tab,
		},
	},
})

local diffview = require("diffview.lib")
local function diffview_toggle()
	local view = diffview.get_current_view()
	if view then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end

vim.api.nvim_create_user_command("DiffviewToggle", diffview_toggle, {})
vim.keymap.set("n", "<leader>tg", diffview_toggle, { desc = "Toggle Diffview" })
vim.keymap.set("n", "tg", diffview_toggle, { desc = "Toggle Diffview" })
