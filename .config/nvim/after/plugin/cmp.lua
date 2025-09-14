local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert,preview,noselect",
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 3 },
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
		["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
