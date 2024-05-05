---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = "onedark",
  hl_override = require "custom.highlights",

  tabufline = {
    enabled = false,
  },

  statusline = {
    theme = "vscode_colored",
    order = "vscode",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "right",
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
