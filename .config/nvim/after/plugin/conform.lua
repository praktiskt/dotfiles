require("conform").setup({
	formatters_by_ft = {
		go = { "goimports", "gofumpt" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		sql = { "sqlfluff" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
