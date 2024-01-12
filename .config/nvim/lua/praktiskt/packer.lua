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
        config = function()
            require("nvim-tree").setup {
                -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L339
                filters = {
                    dotfiles = true
                },
                view = {
                    width = 40
                }
            }
        end
    }

    -- -- Color schemes. See after/plugin/colors.lua
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        flavor = "mocha",
        term_colors = true,
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
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
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }

    -- Match brackets.
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Fade window not in focus
    -- use 'TaDaa/vimade'
    use {
        'sunjon/shade.nvim',
        config = function()
            require("shade").setup()
        end
    }

    -- Highlight todo comments
    use {
        "folke/todo-comments.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}
        },
    }

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

end)
