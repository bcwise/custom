local configs      = require("plugins.configs.lspconfig")
local on_attach    = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
-- capabilities.offsetEncoding = "utf-8"
-- capabilities.offset_encoding = "utf-8"
-- capabilities.clang = {}
-- capabilities.clang.offsetEncoding = "utf-8"
-- capabilities.clang.offset_encoding = "utf-8"

local lspconfig = require "lspconfig"

-- Put a border around the LspInfo (and maybe others?)
require('lspconfig.ui.windows').default_options.border = 'double'


-- if you just want default config for the servers then put them in a table
local servers = {
                  "arduino_language_server",
                  "awk_ls",
                  "bashls",
                  "cmake",
                  "cssls",
                  "dockerls",
                  "erlangls",
                  "html",
                  "jsonls",
                  "lua_ls",
                  "perlls",
                  "puppet",
                  "pylsp",
                  "pylyzer",
                  "pyright",
                  "rls",
                  "rust_analyzer",
                  "sqlls",
                  "texlab",
                  "tsserver",
                  "vimls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--------------------------------------------------------------------------------
-- CLANGD
--------------------------------------------------------------------------------
local clangd_cmd_args = {
  "clangd",
  -- "/home/nemesis3/bwise/opt/llvm-16.0.3/root/bin/clangd",
  "-j=6",
  "--header-insertion=iwyu",
  "--completion-style=detailed",
  "--function-arg-placeholders",
  "--fallback-style=llvm",
  "--clang-tidy",
  "--clang-tidy-checks=*",
  -- "--clang-tidy-checks=cppcoreguidelines," ..
  -- "bugprone-argument-comment," ..
  -- "bugprone-assert-side-effect",
  -- "--some-other-option=foo",
  -- "--yet-another-option=bar",
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  keys = {
    { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(
      "Makefile",
      "configure.ac",
      "configure.in",
      "config.h.in",
      "meson.build",
      "meson_options.txt",
      "build.ninja"
    )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        fname
      ) or require("lspconfig.util").find_git_ancestor(fname)
  end,
  cmd = clangd_cmd_args,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
 
  clangd = function(_, opts)
    local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
    require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
    return true
  end,
}


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
 
