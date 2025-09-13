require("lspconfig").cssls.setup({
	cmd = { "npx", "-y", "-p", "vscode-langservers-extracted", "vscode-css-language-server", "--stdio" },
})
