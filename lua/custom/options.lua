local M = {
  relativenumber = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  pumheight = 10,
  autoindent = true,
  --nohlsearch = true,
  swapfile = false,
  backup = false,
  undodir = os.getenv "HOME" .. "/.vim.undodir",
  undofile = true,
  wrap = false,
  mouse = "a",
  termguicolors = true,
  scrolloff = 10,
  updatetime = 50,
}

return M
