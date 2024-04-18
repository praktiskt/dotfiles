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

require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",
        "gopls",
        "rust_analyzer",
        "ruff_lsp",
        "pyright",
        "htmx",
        "lua_ls"
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- Configure inlay hints
            local opts = lsp_zero.nvim_lua_ls()
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
        rust_analyzer = function()
            require("lspconfig").rust_analyzer.setup({})
        end,
        ruff_lsp = function()
            require("lspconfig").ruff_lsp.setup({
                on_attach = function(client, bufnr)
                    -- Disable hover in favor of Pyright
                    if client.name == 'ruff_lsp' then
                        client.server_capabilities.hoverProvider = false
                    end
                end,

            })
        end,
        pyright = function()
            require("lspconfig").pyright.setup({
                settings = {
                    pyright = {
                        disableOrganizeImports = true
                    },
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = 'openFilesOnly',
                        }
                    }
                }
            })
        end,
        tsserver = function()
            local opts = {
                settings = {
                  typescript = {
                    inlayHints = {
                      includeInlayParameterNameHints = 'all',
                      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                      includeInlayFunctionParameterTypeHints = true,
                      includeInlayVariableTypeHints = true,
                      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                      includeInlayPropertyDeclarationTypeHints = true,
                      includeInlayFunctionLikeReturnTypeHints = true,
                      includeInlayEnumMemberValueHints = true,
                    }
                  },
                  javascript = {
                    inlayHints = {
                      includeInlayParameterNameHints = 'all',
                      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                      includeInlayFunctionParameterTypeHints = true,
                      includeInlayVariableTypeHints = true,
                      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                      includeInlayPropertyDeclarationTypeHints = true,
                      includeInlayFunctionLikeReturnTypeHints = true,
                      includeInlayEnumMemberValueHints = true,
                    }
                  }
                }
              }
            require("lspconfig").tsserver.setup(opts)
        end,
        htmx = function()
            require("lspconfig").htmx.setup({})
        end
        }
    })
