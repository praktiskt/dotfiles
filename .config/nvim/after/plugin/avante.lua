require("avante").setup({
	provider = "groq",
	windows = {
		position = "right", -- the position of the sidebar
		wrap = true, -- similar to vim.o.wrap
		width = 40, -- default % based on available width
		sidebar_header = {
			align = "center", -- left, center, right for title
			rounded = false,
		},
	},
})
