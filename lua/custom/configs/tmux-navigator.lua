vim.cmd("let g:tmux_navigator_no_mappings = 1")
vim.cmd("let g:tmux_navigator_save_on_switch = 2")
vim.cmd("let g:tmux_navigator_perserve_zoom = 1")

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
