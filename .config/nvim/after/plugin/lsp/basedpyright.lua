vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "off",
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
	handlers = {
		["textDocument/publishDiagnostics"] = function() end,
		["textDocument/inlayHint"] = function() end,
		["textDocument/semanticTokens"] = function() end,
	},
})
