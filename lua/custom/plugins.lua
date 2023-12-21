local plugins = {
    {
        "ThePrimeagen/harpoon",
        config = function ()
            return require("custom.configs.harpoon")
        end,
        lazy = false
    },
    {"nvim-tree/nvim-web-devicons"},
    {"christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {"mbbill/undotree"},
    {'prettier/vim-prettier'},
    {
        "rust-lang/rust.vim",
        ft = {"rust"},
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft = {"rust"},
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "custom.configs.rust-tools"
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
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
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui"
    },
    {
        "saecki/crates.nvim",
        dependencies = "hrsh7th/nvim-cmp",
        ft = {"rust", "toml"},
        config = function (_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function ()
            local M = require("plugins.configs.cmp")
            table.insert(M.sources, {name = "cretes"})
            table.insert(M.sources, 1, {
                name = "copilot",
                group_index = 1,
                priorty = 100,
            })
            return M
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {"go", "typescript", "lua"},
        opts = function ()
            return require 'custom.configs.null-ls'
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function ()
            require "custom.configs.lint"
        end
    },
    {
        "mhartington/formatter.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.formatter"
        end
    },
    -- {
    --     "github/copilot.vim",
    --     lazy = false,
    -- },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdb_browser = "/bin/google-chrome"
        end,
        ft = { "markdown" },
    },
    {
        "christoomey/vim-tmux-navigator",
        config = function ()
            require("custom.configs.tmux-navigator")
        end
    }
}

return plugins
