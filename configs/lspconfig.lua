local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Put a border around the LspInfo (and maybe others?)
require('lspconfig.ui.windows').default_options.border = 'double'

-- if you just want default config for the servers then put them in a table
local servers = { "arduino_language_server", "awk_ls", "bashls", "clangd", "cmake", "cssls", "dockerls", "erlangls",
                  "html", "jsonls", "lua_ls", "perlls", "puppet", "pylsp", "pylyzer", "pyright", "rls", "rust_analyzer",
                  "sqlls", "texlab", "tsserver", "vimls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
--
--
-- -- Without the loop, you would have to manually set up each LSP 
-- 
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
