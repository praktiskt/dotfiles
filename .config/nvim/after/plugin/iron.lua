local iron = require("iron.core")
local view = require("iron.view")
local ts_utils = require("nvim-treesitter.ts_utils")

local function get_node_at_cursor_in_buffer(bufnr)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		vim.cmd("badd " .. bufnr)
	end

	local win_id = vim.fn.bufwinid(bufnr)
	if win_id == -1 then
		print("Buffer is not currently displayed in any window.")
		return nil
	end

	local cursor = vim.api.nvim_win_get_cursor(win_id)
	local row = cursor[1] - 1 -- tree-sitter uses 0-based indexing for rows
	local col = cursor[2] -- 0-based indexing for columns

	local parser = vim.treesitter.get_parser(bufnr)
	local tree = parser:parse()[1]
	local root = tree:root()

	return root:named_descendant_for_range(row, col, row, col)
end

local function get_code_block_language(bufnr)
	local node = get_node_at_cursor_in_buffer(bufnr)

	while node do
		if node:type() == "fenced_code_block" then
			for child in node:iter_children() do
				if child:type() == "info_string" then
					-- first child of info_string is typically language
					return vim.treesitter.get_node_text(child:child(), bufnr)
				end
			end
		end
		node = node:parent()
	end

	return nil
end

require("iron.core").setup({
	config = {
		scratch_repl = true,
		repl_definition = {
			sh = {
				command = { "zsh" },
			},
			python = {
				command = { "ipython", "--no-autoindent", "--no-confirm-exit" },
				format = require("iron.fts.common").bracketed_paste,
			},
			markdown = {
				command = function(meta)
					local language = get_code_block_language(meta.current_bufnr)

					-- TODO: Cleanup, use previous definitions so we don't repeat.
					if language == "python" or language == "py" then
						return { "ipython", "--no-autoindent", "--no-confirm-exit" }
					elseif language == "sh" then
						return { "zsh" }
					end
				end,
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
	local node = ts_utils.get_node_at_cursor()
	local sr, sc, _, _ = node:range()
	send_code_block()
	vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
end, {})

vim.api.nvim_create_user_command("ReplStop", function()
	iron.close_repl(vim.bo.filetype)
end, {})

vim.api.nvim_create_user_command("ReplStart", ":IronRepl", {})
vim.api.nvim_create_user_command("ReplAttach", ":IronAttach", {})
vim.api.nvim_create_user_command("ReplHide", ":IronHide", {})
vim.api.nvim_create_user_command("ReplRestart", ":IronRestart", {})
vim.api.nvim_create_user_command("ReplFocus", ":IronFocus", {})
