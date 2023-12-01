vim.g.mapleader = " "
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })

-- tmux maps
-- vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { silent = true })
-- vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { silent = true })
-- vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { silent = true })
-- vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { silent = true })

-- nvim tree (not currently installed)
-- vim.keymap.set('n', '<leader>nf', vim.cmd.NvimTreeFocus, { noremap = true })
-- vim.keymap.set('n', '<leader>nc', vim.cmd.NvimTreeCollapse, { noremap = true })
-- vim.keymap.set('n', '<leader>nt', vim.cmd.NvimTreeToggle, { noremap = true })
-- vim.keymap.set('n', '<leader>ns', vim.cmd.NvimTreeFindFile, { noremap = true })

-- zenmode
vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode, { noremap = true })

-- move lines up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste to void regester
vim.keymap.set("x", "<leader>v", "\"_dP")

-- delete to void regester
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--formatter

--[[

this is some test text

Sampson: Gregory, on my word, we shall not carry this scuffle any longer. The Montagues have dared to cross our path once too often. Let us show them our strength and teach them a lesson they shall not soon forget.
Gregory:You speak true, Sampson. The time has come to put an end to their insolence. I am ready to draw my blade and fight for the honor of the Capulets. Let us provoke them and see how they respond.
Sampson: Aye, let us provoke them indeed. But how shall we do so without risking our lives? Verily, we must be cunning in our approach.

]]
--
