vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>")

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
--vim.keymap.set("n", "x", '"_d')
vim.keymap.set("v", "x", '"_d')
vim.keymap.set("v", "p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { remap = true })

-- New Lines and Such
vim.keymap.set("n", "<C-j>", "o<C-c>k", { remap = true })
vim.keymap.set("n", "<C-k>", "O<C-c>j", { remap = true })

vim.keymap.set("n", "!", ":! ", { remap = true })

vim.keymap.set({ "n", "i" }, "<A-p>", function()
  require("nvterm.terminal").toggle "horizontal"
end)

vim.keymap.set("n", "<leader>go", "<Esc>oif err != nil {<CR>}<Esc>O")

vim.keymap.set("i", "<C-H>", "<C-c>bdiwxi")
vim.keymap.set("n", "t", "`", { remap = true })
-- Ctrl + Backspace
