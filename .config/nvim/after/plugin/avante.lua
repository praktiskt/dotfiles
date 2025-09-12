require("avante").setup({
	provider = "groq",
	providers = {
		groq = {
			__inherited_from = "openai",
			api_key_name = "GROQ_API_KEY",
			endpoint = "https://api.groq.com/openai/v1/",
			model = "meta-llama/llama-4-scout-17b-16e-instruct",
			extra_request_body = {
				max_completion_tokens = 8192,
			},
		},
	},
	selection = {
		hint_display = "none",
	},
	windows = {
		position = "right",
		wrap = true,
		width = 40,
		sidebar_header = {
			enabled = false,
		},
		ask = {
			start_insert = false,
		},
	},
})
vim.opt.laststatus = 3
vim.keymap.set({ "i", "n", "v" }, "<C-A-b>", "<esc>:AvanteToggle<CR>", {})
