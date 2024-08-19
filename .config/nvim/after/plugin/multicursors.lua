local N = require("multicursors.normal_mode")
require("multicursors").setup({
	hint_config = false,
	normal_keys = {
		["<C-d>"] = {
			method = N.find_next,
			opts = { desc = "find next" },
		},
	},
})
