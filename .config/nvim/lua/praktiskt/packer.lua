-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- File picker and fuzzy finder. See after/plugin/telescope.lua
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- Color schemes. See after/plugin/colors.lua
	use({ 'rose-pine/neovim', as = 'rose-pine'})
	--use {
	--	"loctvl842/monokai-pro.nvim",
	--	config = function()
	--		require("monokai-pro").setup()
	--	end
	--}

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

    -- Match brackets.
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Add snippets. FIXME: Configure properly.
    use {
        "rafamadriz/friendly-snippets",
    }

    -- Fade window not in focus
    use 'TaDaa/vimade'

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

    use {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        }
    }
    use { 'saadparwaiz1/cmp_luasnip' }


end)
