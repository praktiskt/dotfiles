-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- File picker and fuzzy finder. See after/plugin/telescope.lua
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use "nvim-tree/nvim-web-devicons"

    use {
        "nvim-tree/nvim-tree.lua",
        requires = { {"nvim-tree/nvim-web-devicons"} },
        config = function()
            require("nvim-tree").setup {
                -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L339
                filters = {
                    dotfiles = true
                },
                view = {
                    width = 35
                }
            }
        end
    }


    -- -- Color schemes. See after/plugin/colors.lua
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        flavor = "mocha",
        term_colors = true
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Nice highlighting. See after/plugin/treesitter.lua
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- Configure LSP. See after/plugin/lsp.lua 
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use {
        "TabbyML/vim-tabby"
    }

    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        as = "ibl",
        config = function()
            require("ibl").setup()
        end
    }


    -- Match brackets.
    use{
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recomended as each new version will have breaking changes
        config=function ()
            require('ultimate-autopair').setup({
                --Config goes here
            })
        end,
    }


    -- Fade window not in focus
    use {
        'levouh/tint.nvim',
        config = function()
            require("tint").setup {
                tint = -65,  -- Darken colors, use a positive value to brighten
                saturation = 0.6,  -- Saturation to preserve
                tint_background_colors = false,  -- Tint background portions of highlight groups
            }
        end
    }

    -- Highlight todo comments
    use {
        "folke/todo-comments.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}
        },
    }

    -- Highlight word under cursor with LSP, tree-sitter or regex
    use { "RRethy/vim-illuminate" }

    -- Strip whitespace as you are writing.
    use {
        'lewis6991/spaceless.nvim',
        config = function()
            require'spaceless'.setup()
        end
    }

    -- Add snippets
    use { "rafamadriz/friendly-snippets" }
    use {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'nvim-telescope/telescope-symbols.nvim' }

    -- Multi-cursor
    use { "mg979/vim-visual-multi" }

    -- Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      -- see after/plugin/toggleterm.lua
      require("toggleterm").setup({
          size = function(term)
              if term.direction == "horizontal" then
                  return 20
              elseif term.direction == "vertical" then
                  return vim.o.columns * 0.4
              end
          end,
      })
    end}

    -- VCS show changes in sidebar
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup {
            }
        end
    }

    -- Mimimap (right side-panel)
    use {
        'wfxr/minimap.vim',
        config = function()
            vim.g.minimap_width = 10
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 0
            vim.g.minimap_left = 0
            vim.g.minimap_block_filetypes = {'fugitive', 'nvim-tree', 'tagbar', 'fzf', 'telescope', 'NvimTree'}
            vim.g.minimap_block_buftypes = {'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt', 'NvimTree'}
            vim.g.minimap_close_filetypes = {'startify', 'netrw', 'vim-plug', 'packer', 'NvimTree'}
            vim.g.minimap_highlight_range = 1
            vim.g.minimap_highlight_search = 1
            vim.g.minimap_git_colors = 1
        end
    }

end)
