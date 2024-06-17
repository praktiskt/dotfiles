local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Auto-format Python files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !black --preview -q " .. fileName)
        vim.cmd(":silent !isort --profile black --float-to-top -q " .. fileName)
        -- vim.cmd(":silent !docformatter --in-place --black " .. fileName)
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.go" },
    desc = "Auto-format Golang files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !goimports -w " .. fileName)
        vim.cmd(":silent !gofumpt -w " .. fileName)
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.rs" },
    desc = "Auto-format Rust files after saving",
    callback = function()
        vim.cmd(":RustFmt")
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.*" },
    desc = "Close tree when entering a file",
    callback = function()
        vim.cmd(":NvimTreeClose")
    end,
    group = autocmd_group,
})

