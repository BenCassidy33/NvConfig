local dap = require "dap"

local codelldb_path = "$HOME/installs/extension/adapter/codelldb"

-- dap.adapters.lldb = {
--   type = "executable",
--   command = os.getenv "HOME" .. "/usr/bin/lldb-vscode-15", -- adjust as needed, must be absolute path
--   name = "lldb",
-- }

--- $HOME/installs/extension/adapter/codelldb -

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = codelldb_path,
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.rust = {
  {
    type = "codelldb",
    name = "Launch",
    request = "launch",
    program = function()
      return codelldb_path
    end,
    stopOnEntry = true,
    args = {},
    runInTerminal = false,
  },
}
