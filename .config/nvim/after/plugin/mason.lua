require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.DEBUG,
})

local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"rust_analyzer",
		"ruff",
		"basedpyright",
		"htmx",
		"lua_ls",
		"dockerls",
		"yamlls",
		"helm_ls",
	},
	handlers = {
		lsp_zero.default_setup,
		dockerls = function()
			lspconfig.dockerls.setup({})
		end,
		lua_ls = function()
			-- Configure inlay hints
			local opts = lsp_zero.nvim_lua_ls()
			opts["settings"] = {
				Lua = {
					hint = {
						enable = true,
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			}
			lspconfig.lua_ls.setup(opts)
		end,
		gopls = function()
			-- Configure inlay hints
			local opts = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			}
			lspconfig.gopls.setup(opts)
		end,
		rust_analyzer = function()
			lspconfig.rust_analyzer.setup({})
			vim.g.rustfmt_autosave = 1
		end,
		ruff = function()
			lspconfig.ruff.setup({
				on_attach = function(client, _)
					-- Disable hover in favor of Pyright
					if client.name == "ruff" then
						client.server_capabilities.hoverProvider = false
					end
				end,
			})
		end,
		basedpyright = function()
			lspconfig.basedpyright.setup({
				settings = {
					pyright = {
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})
		end,
		htmx = function()
			lspconfig.htmx.setup({
				filetypes = {
					"html",
					"htmlangular",
					"html-eex",
					"javascript",
					"javascriptreact",
					"reason",
					"rescript",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"templ",
				},
			})
		end,
		yamlls = function()
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						kubernetes = "*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
						["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
						["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
						["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
						["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
						["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
						["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
					},
				},
			})
		end,
		helm_ls = function()
			lspconfig.helm_ls.setup({
				logLevel = "info",
				valuesFiles = {
					mainValuesFile = "values.yaml",
					lintOverlayValuesFile = "values.lint.yaml",
					additionalValuesFilesGlobPattern = "values*.yaml",
				},
				yamlls = {
					enabled = false,
					enabledForFilesGlob = "*.{yaml,yml}",
					diagnosticsLimit = 50,
					showDiagnosticsDirectly = false,
					path = "yaml-language-server",
					config = {
						schemas = {
							kubernetes = "templates/**",
						},
						completion = true,
						hover = true,
						-- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
					},
				},
			})
		end,
	},
})
