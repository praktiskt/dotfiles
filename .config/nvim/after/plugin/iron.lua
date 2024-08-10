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
		repl_open_cmd = view.right("40%"),
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

local function send_block_or_line()
	local ts = vim.treesitter

	local parser = ts.get_parser(0)
	local syntax_tree = parser:parse()[1]

	local root = syntax_tree:root()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor[1] - 1, cursor[2]

	-- Locate the outermost node for a given type.
	local trigger_nodes = {
		"function",
		"function_definition",
		"class",
		"class_definition",
		"block",
		"if_statement",
		"else_statement",
		"try_statement",
	}
	local node = root:named_descendant_for_range(row, col, row, col)
	local context_node = nil
	while node do
		local node_type = node:type()
		for _, type in ipairs(trigger_nodes) do
			if node_type == type then
				context_node = node
			end
		end
		node = node:parent()
	end

	if context_node then
		local start_row, start_col, end_row, end_col = context_node:range()
		vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
		vim.cmd("normal v")
		vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col })
		iron.visual_send()
	else
		iron.send_line()
	end
end

vim.api.nvim_create_user_command("ReplRunBlockAndAdvance", function()
	send_block_or_line()
	move_to_next_code_line()
end, {})

vim.api.nvim_create_user_command("ReplRunBlock", function()
	send_block_or_line()
end, {})

vim.api.nvim_create_user_command("ReplStart", ":IronRepl", {})
vim.api.nvim_create_user_command("ReplAttach", ":IronAttach", {})
vim.api.nvim_create_user_command("ReplHide", ":IronHide", {})
vim.api.nvim_create_user_command("ReplRestart", ":IronRestart", {})
vim.api.nvim_create_user_command("ReplFocus", ":IronFocus", {})
