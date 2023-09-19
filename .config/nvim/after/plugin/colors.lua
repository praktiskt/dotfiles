function Color(color)
	-- color = color or "rose-pine"
    color = color or "catppuccin-mocha"
    -- color = color or "gruvbox"
    -- vim.g.gruvbox_contrast_dark = "hard"
    -- color = color or "monokai-pro"
    -- require("monokai-pro").setup({
    --     -- See options here: https://github.com/loctvl842/monokai-pro.nvim
    --     filter="spectrum"
    -- })

	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color()
