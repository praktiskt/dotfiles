local mc = require("multicursor-nvim")
mc.setup()
vim.keymap.set({"n", "v"}, "<C-d>", function() mc.matchAddCursor(1) end)
mc.addKeymapLayer(function(layerSet)
    layerSet({"n", "v"}, "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)


