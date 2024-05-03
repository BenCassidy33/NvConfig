local plugins = {
  {
    "ThePrimeagen/harpoon",
    config = function()
      return require "custom.configs.harpoon"
    end,
    lazy = false,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "mbbill/undotree" },
  { "prettier/vim-prettier" },
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
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
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
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
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "svelte" },
    config = function()
      require("nvim-ts-autotag").setup()
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
    "jbyuki/nabla.nvim",
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
    "https://github.com/pocco81/true-zen.nvim",
    ft = "markdown, docx",
    config = function()
      require "custom.configs.true-zen"
    end,
  },
  {
    "https://github.com/ellisonleao/carbon-now.nvim",
    lazy = false,
    config = function()
      require "custom.configs.carbon-now"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
      vim.g.mkdp_browser = "brave-browser"
    end,
  },
  {
    "andrewferrier/wrapping.nvim",
    ft = { "markdown" },
    config = function()
      require("wrapping").setup()
    end,
  },
  {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require "custom.configs.treesitter-context"
    end,
  },
}

return plugins
