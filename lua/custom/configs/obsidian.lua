local opts = {
  workspaces = {
    {
      name = "Notes",
      path = "~/Notes/",
    },
  },

  log_level = vim.log.levels.INFO,

  completion = {
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

  picker = {
    name = "telescope.nvim",
    mappings = {
      ["<C-x>"] = {
        action = function(selection)
          return require("obsidian").util.open_file(selection)
        end,
        opts = { noremap = true, expr = true },
      },
    },
  },

  note_id_func = function(title)
    local prefix = ""
    if title ~= nil then
      prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        prefix = prefix .. string.char(math.random(65, 90))
      end
    end
    local date = tostring(os.date "%m-%d-%Y")
    return prefix .. " (" .. date .. ")" .. ""
  end,

  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    --vim.fn.jobstart({"open", url})  -- Mac OS
    vim.fn.jobstart { "xdg-open", url } -- linux
  end,
}

return opts
