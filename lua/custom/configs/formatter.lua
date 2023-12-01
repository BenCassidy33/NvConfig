local M = {
    filetype = {
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },

        typescript = {
            require("formatter.filetypes.javascript").prettier
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)}
    }
    vim.lsp.buf.execute_command(params)
end
