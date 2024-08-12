local iron = require("iron.core")
local view = require("iron.view")
require("iron.core").setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = {
				command = { "zsh" },
			},
			python = {
				command = { "ipython", "--no-autoindent" },
				format = require("iron.fts.common").bracketed_paste,
			},
		},
		repl_open_cmd = view.split.vertical.botright("40%"),
	},
	keymaps = {
		visual_send = "<A-Enter>",
		-- See custom key binds
	},
	highlight = {
		italic = true,
	},
	ignore_blank_lines = true,
})

local function extract_comment_symbol()
	local comment_string = vim.bo.commentstring
	if not comment_string or comment_string == "" then
		-- no comment type for this file type
		return
	else
		return comment_string:match("^(%s*[^%s]+)")
	end
end

local function move_to_next_code_line()
	local last_line = vim.fn.line("$")
	local current_line = vim.fn.line(".")
	if current_line == last_line then
		return
	end

	local comment_symbol = extract_comment_symbol()
	if not comment_symbol then
		return
	end

	-- Allow for spaces before the comment symbol
	-- `vim.fn.escape` escapes the comment symbol for use in a pattern
	local comment_pattern = "^%s*" .. vim.fn.escape(comment_symbol, "\\^$.*[]")

	for i = current_line + 1, last_line do
		local line_content = vim.fn.getline(i)

		if line_content:match(comment_pattern) == nil and line_content:match("%S") then
			local first_nonspace_pos = line_content:find("%S")
			vim.api.nvim_win_set_cursor(0, { i, first_nonspace_pos - 1 })
			return
		end
	end
end

local function send_code_block()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()

	local stop_nodes = {
		"assignment_statement",
		"variable_declaration",
		"expression_statement",
		"call_expression",
		"argument_list",
		"parenthesized_expression",
	}
	local root = node
	while node do
		if vim.tbl_contains(stop_nodes, node:type()) then
			root = node
			break
		end
		node = node:parent()
	end

	local sr, sc, er, ec = root:range()
	vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
	vim.cmd("normal v")
	vim.api.nvim_win_set_cursor(0, { er + 1, ec })
	iron.visual_send()
end

vim.api.nvim_create_user_command("ReplRunBlockAndAdvance", function()
	send_code_block()
	move_to_next_code_line()
end, {})

vim.api.nvim_create_user_command("ReplRunBlock", function()
	send_code_block()
end, {})

vim.api.nvim_create_user_command("ReplStart", ":IronRepl", {})
vim.api.nvim_create_user_command("ReplAttach", ":IronAttach", {})
vim.api.nvim_create_user_command("ReplHide", ":IronHide", {})
vim.api.nvim_create_user_command("ReplRestart", ":IronRestart", {})
vim.api.nvim_create_user_command("ReplFocus", ":IronFocus", {})
