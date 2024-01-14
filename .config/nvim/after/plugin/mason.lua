require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
    log_level = vim.log.levels.DEBUG
})

require("mason-lspconfig").setup()



