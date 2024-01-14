function RunBuildC()
    vim.cmd("vsplit");
    local win = vim.api.nvim_get_current_win();
    local buf = vim.api.nvim_get_current_buf(true, true);
    vim.api.nvim_set_current_win(win, buf);
end
