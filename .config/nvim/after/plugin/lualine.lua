local function mc_is_active()
	local ok, hydra = pcall(require, "hydra.statusline")
	return ok and hydra.is_active()
end

local function mc_get_name()
	local ok, hydra = pcall(require, "hydra.statusline")
	if ok then
		return hydra.get_name()
	end
	return ""
end
require("lualine").setup({
	sections = {
		lualine_c = {
			{ "filename", path = 1 },
			{
				mc_get_name,
				cond = mc_is_active,
			},
		},
	},
	options = {
		icons_enabled = false,
		globalstatus = false,
		always_divide_middle = true,
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
})
