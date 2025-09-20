vim.lsp.config("css", {
	cmd = { "npx", "-y", "-p", "vscode-langservers-extracted", "vscode-css-language-server", "--stdio" },
	filetypes = { "css" },
})
