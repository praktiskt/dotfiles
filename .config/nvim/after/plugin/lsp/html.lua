require("lspconfig").html.setup({
	cmd = {
		"npx",
		"-y",
		"-p",
		"vscode-langservers-extracted",
		"vscode-html-language-server",
		"--stdio",
	},
})
