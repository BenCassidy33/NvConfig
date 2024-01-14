require('custom.remaps')
require("custom.commands")

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd("set autoindent")
vim.cmd("set nohlsearch")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.opt.undofile = true

vim.opt.wrap = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
--vim.opt.signcoloumn = "yes"
--vim.opt.colorcolumn = "100"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.cmd("set clipboard+=unnamedplus")

vim.api.nvim_create_autocmd( "FileType", {
  pattern = {"markdown", "text"},
  callback = function ()
        vim.cmd("set linebreak")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"typescript", "ts", "js", "tsx", "jsx"},
    callback = function ()
        vim.opt.shiftwidth=2
        vim.opt.tabstop=2
    end
})

vim.keymap.set("n", "<leader>ps", function ()
    local builtin = require('telescope.builtin')
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    })
end)

vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]]

vim.diagnostic.disable()

--vim.keymap.set("n", "<leader>n", ":e ~/", { remap = true })
