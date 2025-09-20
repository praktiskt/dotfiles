vim.lsp.config("html", {
	cmd = {
		"npx",
		"-y",
		"-p",
		"vscode-langservers-extracted",
		"vscode-html-language-server",
		"--stdio",
	},
})
