vim.g.mapleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })

-- move lines up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste to void regester
--vim.keymap.set("x", "<leader>v", "\"_dP")

-- delete to void regester
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { remap = true })

vim.keymap.set("n", "<leader>xe", function()
  vim.cmd "!./buildc.sh"
end)

-- New Lines and Such

vim.keymap.set("n", "<C-j>", "o<C-c>k", { remap = true })
vim.keymap.set("n", "<C-k>", "O<C-c>j", { remap = true })

vim.keymap.set("n", "!", ":! ", { remap = true })

vim.keymap.set("n", "<A-p>", function()
  require("nvterm.terminal").toggle "horizontal"
end)

vim.keymap.set("n", "<leader>err", "<Esc>oif err != nil {<CR>}<Esc>O")

vim.keymap.set("n", "<leader>ls", function()
  vim.cmd "so"
  vim.cmd "Lazy sync"
end)

vim.keymap.set("i", "{", function()
  print "test"
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Space><Space><Left>", true, true, true), "n", true)
end, { noremap = true, silent = true })
