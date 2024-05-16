local plugins = {
  {
    "ThePrimeagen/harpoon",
    config = function()
      return require "custom.configs.harpoon"
    end,
    lazy = false,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "prettier/vim-prettier" },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "gopls",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "sqlls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
      vim.g.dap_virtual_text = true
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "cretes" })
      table.insert(M.sources, 1, {
        name = "copilot",
        group_index = 1,
        priorty = 100,
      })
      return M
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      require "custom.configs.tmux-navigator"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "custom.configs.lazygit"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html" },
    config = function()
      require("nvim-ts-autotag").setup { autotag = { enable = true } }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "rust",
      }
      return opts
    end,
  },
  {
    "https://github.com/stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "custom.configs.oil"
    end,
  },
  {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      require "custom.configs.wilder"
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "https://github.com/github/copilot.vim",
    lazy = false,
    --ft = { "go", "typescript", "javascript", "lua", "rust" },
  },
  {
    "https://github.com/ellisonleao/carbon-now.nvim",
    config = function()
      require "custom.configs.carbon-now"
    end,
  },
  {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
        },
      },
      plugins = {
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
    },
  },
  {
    "https://github.com/epwalsh/obsidian.nvim",
    ft = { "markdown" },
    opts = require "custom.configs.obsidian",
    event = "VeryLazy",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.pick",
  },
  {
    "https://github.com/edgedb/edgedb-vim",
    ft = { "edgeql" },
  },
  {
    "https://github.com/shortcuts/no-neck-pain.nvim",
    ft = { "markdown", "text" },
    cmd = "NoNeckPain",
    lazy = function()
      return string.find(vim.fn.expand "%:p:h", "Notes") == nil
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  { "https://github.com/kristijanhusak/vim-dadbod-completion" },
  {
    "https://github.com/nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      return require "custom.configs.lualine"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}

return plugins
