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
    ensure_installed = {"tsserver", "rust_analyzer", "gopls"},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- Configure inlay hints
            local lua_opts = lsp_zero.nvim_lua_ls()
            lua_opts["on_attach"] = function(client, bufnr)
                ih.on_attach(client, bufnr)
            end
            lua_opts["settings"] = {
                Lua = {
                    hint = {
                        enable = true
                    },
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
        gopls = function()
            -- Configure inlay hints
            local go_opts = {}
            go_opts["on_attach"] = function(client, bufnr)
                ih.on_attach(client, bufnr)
            end
            go_opts["settings"] = {
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
            }
            require("lspconfig").gopls.setup(go_opts)
        end
    }
})



