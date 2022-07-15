local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = {
        "bashls",
        "clangd",
        "clojure_lsp",
        "cmake",
        "elixirls",
        "ember",
        "gopls",
        "rust_analyzer",
        "solargraph",
        "texlab",
        "tsserver",
        "vimls",
    }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
