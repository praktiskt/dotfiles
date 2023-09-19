local lsp = require('lsp-zero').preset({})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  preselect = 'item',
  completion = {
      completeopt = 'menu,menuone,noinsert,preview'
  },
  sources = {
      {name = 'nvim_lsp'},
      {name = 'luasnip'}
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
    ["<C-Space>"] = cmp.mapping.complete(),
  }
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Add VSCode snippets (from rafamadriz/friendly-snippets)
require('luasnip.loaders.from_vscode').lazy_load()

-- Load snippets from .config/nvim/snippets
require("luasnip.loaders.from_snipmate").lazy_load()

lsp.setup()
