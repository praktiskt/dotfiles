vim.o.autoread = true
vim.g.opencode_opts = {
	provider = {
		enabled = "snacks",
		snacks = {
			win = {
				enter = true,
			},
		},
	},
	--port = 54321,
}

vim.keymap.set({ "n", "x", "v" }, "<leader>ae", function()
	require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })

vim.keymap.set({ "n", "v" }, "<leader>aa", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "v", "t" }, "<C-S-b>", function()
	require("opencode").toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "v", "t" }, "<leader>aq", function()
	require("opencode").stop()
end, { desc = "Stop opencode" })
