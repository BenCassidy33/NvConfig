local null_ls = require("null-ls")
local format = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
    sources = {
        format.gofumpt,
        format.goimports_reviser,
        format.golines,
        format.lua_format,
        format.prettier,
        format.stylua,
        -- format.mypy,
        -- format.ruff,
        format.clang_format,
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return opts
