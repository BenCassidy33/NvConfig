vim.api.nvim_create_user_command("Open", function()
  local builtin = require "telescope.builtin"
  builtin.find_files {
    prompt_title = "Open File",
    cwd = "~",
  }
end, {})

vim.api.nvim_create_user_command("G", function()
  vim.cmd "vertical Git"
end, {})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "text" },
--   callback = function()
--     opt.conceallevel = 2
--     opt.spelllang = "en_us"
--     opt.spell = true
--     opt.wrap = true
--     opt.shiftwidth = 4
--     opt.tabstop = 2
--
--     if string.find(vim.fn.expand "%:p", "Notes") then
--       vim.wo.wrap = true
--       vim.wo.linebreak = true
--       vim.cmd "NoNeckPain"
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "typescript", "ts", "js", "tsx", "jsx", "lua" },
--   callback = function()
--     opt.shiftwidth = 2
--     opt.tabstop = 2
--   end,
-- })
