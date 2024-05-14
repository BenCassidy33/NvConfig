require "custom.remaps"
require "custom.commands"
require "custom.neovide"

local opt = vim.opt

function options(opts)
  for k, v in ipairs(opts) do
    opt[k] = v
  end
end

--local options = require "options"
--options(options)

opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.pumheight = 10
opt.autoindent = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim.undodir"
opt.undofile = true
opt.wrap = false
opt.mouse = "a"
opt.termguicolors = true
opt.scrolloff = 10
opt.isfname:append "@-@"
opt.updatetime = 50

vim.cmd "set clipboard+=unnamedplus"
vim.cmd "set nohlsearch"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    opt.conceallevel = 2
    opt.spelllang = "en_us"
    opt.spell = true
    opt.wrap = true
    opt.shiftwidth = 4
    opt.tabstop = 2

    if string.find(vim.fn.expand "%:p", "Notes") then
      vim.wo.wrap = true
      vim.wo.linebreak = true
      vim.cmd "NoNeckPain"
      vim.cmd "Copilot disable"
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "ts", "js", "tsx", "jsx", "lua" },
  callback = function()
    opt.shiftwidth = 2
    opt.tabstop = 2
  end,
})

vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\CR")]]

if vim.g.neovide then
  vim.g.transparency = false

  vim.o.guifont = "JetBrains Mono NL Medium:h14"

  vim.g.neovide_scale_factor = 1.00
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(0.15)
    vim.cmd "redraw!"
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(-0.15)
    vim.cmd "redraw!"
  end)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = {
    severity_limit = "Error",
  },
  virtual_text = {
    severity_limit = "Error",
  },
})

-- comment if want to use nvchad themes

--vim.keymap.set("n", "<leader>n", ":e ~/", { remap = true })
