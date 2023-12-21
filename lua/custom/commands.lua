vim.api.nvim_create_user_command("Open", function ()
    local builtin = require('telescope.builtin')
    builtin.find_files({
        prompt_title = "Open File",
        cwd = "~",
    })
end, {})

