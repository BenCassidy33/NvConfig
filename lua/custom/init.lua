require('custom.remaps')
require("custom.commands")
require('custom.neovide')

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

--vim.opt.guicursor = ""
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
--vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.cmd("set clipboard+=unnamedplus")

vim.api.nvim_create_autocmd( "FileType", {
  pattern = {"markdown", "text"},
  callback = function ()
    vim.cmd("set linebreak")
    -- vim.cmd("SoftPencil")
    vim.cmd("set tw=50")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typescript", "ts", "js", "tsx", "jsx", "lua"},
  callback = function ()
    vim.opt.shiftwidth=2
    vim.opt.tabstop=2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"asm"},
  callback = function ()
    vim.cmd("set ft=nasm")
  end
})

vim.keymap.set("n", "<leader>ps", function ()
  local builtin = require('telescope.builtin')
  builtin.grep_string({
    search = vim.fn.input("Grep > ")
  })
end)

vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]]

if vim.g.neovide then
  vim.o.guifont = "Iosevka Term:h14"

  vim.g.neovide_scale_factor = 0.70
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(0.15)
    vim.cmd("redraw!")
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(-0.15)
    vim.cmd("redraw!")
  end)
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = "Error"
    },
    virtual_text = {
      severity_limit = "Error",
    },
  }
)

-- comment if want to use nvchad themes

--vim.keymap.set("n", "<leader>n", ":e ~/", { remap = true })
