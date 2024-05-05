local opts = {
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes/",
    },
  },

  log_level = vim.log.levels.INFO,

  compleation = {
    nvim_cmp = true,
    min_chars = 2,
  },

  mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
}

return opts
