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
	on_attach = function(client)
		client.server_capabilities.definitionProvider = false
		client.server_capabilities.typeDefinitionProvider = false
		client.server_capabilities.referencesProvider = false
		client.server_capabilities.implementationProvider = false
	end,
})
