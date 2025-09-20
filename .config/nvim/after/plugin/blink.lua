require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
	snippets = {
		preset = "luasnip",
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
	completion = {
		ghost_text = { enabled = true },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
		list = {
			selection = {
				preselect = false,
			},
		},
	},
})
