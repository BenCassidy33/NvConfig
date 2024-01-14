local M = {}

M.ui = {
    transparency = true,
    theme = "tokyonight",

    tabufline = {
        enabled= false
    }
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


M.plugins = 'custom.plugins'
M.mappings = require("custom.mappings")
return M
