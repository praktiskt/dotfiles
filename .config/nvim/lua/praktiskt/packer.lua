-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- File picker and fuzzy finder. See after/plugin/telescope.lua
    use { "nvim-telescope/telescope.nvim", tag = "0.1.x" }
    use "nvim-tree/nvim-web-devicons"
    use "nvim-lua/plenary.nvim"

    -- File tree
    use {
        "nvim-tree/nvim-tree.lua",
        tag = "nvim-tree-v0.99.0",
        requires = {
            { "nvim-tree/nvim-web-devicons" }
        },
        config = function()
            require("nvim-web-devicons")
            require("nvim-tree").setup {
                -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L339
                filters = {
                    dotfiles = false,
                    custom = { '^.git$', '^node_modules$', '^venv$', '^target/debug$' }
                },
                view = {
                    width = 35
                }
            }
        end
    }

    -- Color schemes. See after/plugin/colors.lua
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        flavor = "mocha",
        term_colors = true
    }

    -- Statusline
    use { "nvim-lualine/lualine.nvim" }

    -- Nice highlighting. See after/plugin/treesitter.lua
    use {
        "nvim-treesitter/nvim-treesitter",
        { run = ":TSUpdate" }
    }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- Configure LSP. See after/plugin/lsp.lua
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use {
        "AckslD/swenv.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" }
        }
    }

    use {
        "stevearc/dressing.nvim"
    }

    -- Autocomplete
    use { "TabbyML/vim-tabby" }

    -- Diagnostics
    use { "folke/trouble.nvim" }

    -- Display shortcuts on pause for current chord
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    -- Add indentation guide
    use {
        "lukas-reineke/indent-blankline.nvim",
        as = "ibl",
        config = function()
            require("ibl").setup()
        end
    }

    -- Match brackets.
    use {
        "altermo/ultimate-autopair.nvim",
        event={"InsertEnter","CmdlineEnter"},
        branch="v0.6",
        config=function ()
            require("ultimate-autopair").setup({
                -- Config goes here
            })
        end,
    }

    -- Add end to things like Ruby, Julia, Lua ...
    use { "RRethy/nvim-treesitter-endwise" }

    -- Fade window not in focus
    use {
        "levouh/tint.nvim",
        config = function()
            require("tint").setup {
                tint = -65,  -- Darken colors, use a positive value to brighten
                saturation = 0.6,  -- Saturation to preserve
                tint_background_colors = false,  -- Tint background portions of highlight groups
            }
        end
    }

    -- Highlight todo comments
    use { "folke/todo-comments.nvim" }

    -- Highlight word under cursor with LSP, tree-sitter or regex
    use { "RRethy/vim-illuminate" }

    -- Strip white space as you are writing.
    use {
        "lewis6991/spaceless.nvim",
        config = function()
            require"spaceless".setup()
        end
    }

    -- Add snippets
    use { "nvim-telescope/telescope-symbols.nvim" }

    -- Multi-cursor
    use { "mg979/vim-visual-multi" }

    -- Terminal
    use {"akinsho/toggleterm.nvim", tag = "*", config = function()
        -- see after/plugin/toggleterm.lua
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 1
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            autochdir = true,
        })
    end}

    -- VCS show changes in sidebar
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
            }
        end
    }

    -- Decorated scrollbar (requires >=0.10.0)
    use {
        "lewis6991/satellite.nvim",
        config = function()
            require("satellite").setup {}
        end
    }

    -- Show colors on color codes, like #ffffff
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }

end)
