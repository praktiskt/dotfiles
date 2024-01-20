require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
    log_level = vim.log.levels.DEBUG
})

local lsp_zero = require("lsp-zero")
local ih = require("lsp-inlayhints")
ih.setup()

require("mason-lspconfig").setup({
    ensure_installed = {"tsserver", "gopls", "rust_analyzer", "pylsp"},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- Configure inlay hints
            local opts = lsp_zero.nvim_lua_ls()
            opts["on_attach"] = function(client, bufnr)
                ih.on_attach(client, bufnr)
            end
            opts["settings"] = {
                Lua = {
                    hint = {
                        enable = true
                    },
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
            require("lspconfig").lua_ls.setup(opts)
        end,
        gopls = function()
            -- Configure inlay hints
            local opts = {
                on_attach = function(client, bufnr)
                    ih.on_attach(client, bufnr)
                end,
                settings = {
                    gopls = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true
                        }
                    }
                }}
            require("lspconfig").gopls.setup(opts)
        end,
        rust_analyzer = lsp_zero.noop,
        pylsp = function()
            require("lspconfig").pylsp.setup({})
        end
    }
})
