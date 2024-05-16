vim.g.mapleader = " "

require("custom.utils").set_mappings {
  { "i", "jj", "<Esc>", { noremap = true, silent = true } },
  { "i", "<C-c>", "<Esc>" },
  { "v", "K", ":m '<-2<CR>gv=gv" },
  { "v", "J", ":m '>+1<CR>gv=gv" },
  { "n", "<C-d>", "<C-d>zz" },
  { "n", "<C-u>", "<C-u>zz" },
  { "n", "n", "nzzzv" },
  { "n", "N", "Nzzzv" },
  { "v", "x", '"_d' },
  { "v", "p", [["_dP]] },
  { { "n", "v" }, "<leader>y", [["+y]] },
  { "n", "<leader>Y", [["+Y]] },
  { "n", "<leader>gg", "<cmd>LazyGit<CR>", { silent = true } },
  { "n", "-", "<CMD>Oil<CR>", { remap = true } },
  { "n", "<C-j>", "o<C-c>k", { remap = true } },
  { "n", "<C-k>", "O<C-c>j", { remap = true } },
  { "n", "!", ":! ", { remap = true } },
  { "n", "<leader>go", "<Esc>oif err != nil {<CR>}<Esc>O" },
  { "i", "<C-H>", "<C-c>bdiwxi" },
  { "n", "t", "`", { remap = true } },
  {
    { "n", "i" },
    "<A-p>",
    function()
      require("nvterm.terminal").toggle "horizontal"
    end,
  },
  { "n", "<leader>bp", "<CMD>bprev<CR>", { silent = true, remap = true } },
  { "n", "<leader>bn", "<CMD>bnext<CR>", { silent = true } },
  { "n", "<leader>bc", "<CMD>enew<CR>", { silent = true } },
  { "n", "<leader>bd", "<CMD>bdelete<CR>", { silent = true } },
  { "n", "<leader>bf", "<CMD>Telescope buffers<CR>", { silent = true } },

  { "n", "<leader>co", "<CMD>Telescope git_commits<CR>", { silent = true } },
  { "n", "<leader>br", "<CMD>Telescope git_branches<CR>", { silent = true } },
}
