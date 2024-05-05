local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilitiesls
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "gopls",
  "pyright",
  "jdtls",
  "eslint",
  "tsserver",
  "tailwindcss",
  "htmx",
  "dockerls",
  "taplo",
  "lua_ls",
  "docker_compose_language_service",
  "ocamllsp",
  "svelte",
  "clangd",
  "asm_lsp",
  "ols",
  "java_language_server",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.grammarly.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "grammarly-languageserver", "--stdio" },
--     filetypes = { "markdown" },
--     init_options = { clientId = "client_BaDkMgx4X19X9UxxYRCXZo " }
-- }

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "",
    },
  },
  root_dir = util.root_pattern(".git", "package.json"),
}

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
}

vim.keymap.set("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>gd", function()
  vim.lsp.buf.definition()
end)
vim.keymap.set("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end)
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float()
end)
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover()
end)

vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_prev()
end)
vim.keymap.set("n", "<leader>ws", function()
  vim.lsp.buf.workspace_symbol()
end)
vim.keymap.set("n", "<leader>vrf", function()
  vim.lsp.buf.references()
end)

vim.keymap.set("i", "<C-h>", function()
  vim.lsp.buf.signature_help()
end)
