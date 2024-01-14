local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer"
})

local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  preselect = 'item',
  completion = {
      completeopt = 'menu,menuone,noinsert,preview'
  },
  sources = {
      {name = 'nvim_lsp'},
      {name = 'nvim_lsp_signature_help'},
      {name = 'luasnip'}
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
 	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
    -- ["<C-Space>"] = cmp.mapping.complete(),
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gne', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', 'ge', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', 'gpe', function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Configure golang language server
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

-- Add VSCode snippets (from rafamadriz/friendly-snippets)
require('luasnip.loaders.from_vscode').lazy_load()

-- Load snippets from .config/nvim/snippets
require("luasnip.loaders.from_snipmate").lazy_load()

lsp.setup()
