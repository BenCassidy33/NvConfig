---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = false,
  theme = "onedark",
  hl_override = require("custom.highlights").hl_override,
  changed_themes = require("custom.highlights").changed_themes,

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
