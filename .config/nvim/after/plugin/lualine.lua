require('lualine').setup({
    sections = {
        lualine_c = {
            { "filename", path = 1 }
        }
    },
    options = {
        icons_enabled = false,
        globalstatus = false,
        always_divide_middle = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
    }
}) 
