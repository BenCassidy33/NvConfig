local M = {}

M.LoadByDir = function(table)
  local dir_name = string.lower(vim.fn.expand "%:p:h")

  for dir, plugins in ipairs(table) do
    if string.find(dir_name, tostring(dir)) then
      for _, plugin in plugins do
        vim.api.nvim_echo({ { "Lazy loading " .. tostring(plugin), "Comment" } }, true, {})
        vim.cmd("Lazy load " .. tostring(plugin))
      end
    end
  end
end

M.set_nvim_options = function(opts)
  for k, v in ipairs(opts) do
    opt[k] = v
  end
end

M.set_mappings = function(mappings)
  for _, v in ipairs(mappings) do
    vim.keymap.set(v[1], v[2], v[3], v[4])
  end
end

return M
