vim.lsp.config("ty", {
	on_attach = function(client)
		client.server_capabilities.completionProvider = nil
		client.server_capabilities.signatureHelpProvider = nil
		client.server_capabilities.hoverProvider = nil
	end,
})
