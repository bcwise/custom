local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Hover
  b.hover.dictionary,

  -- BASH/Shells
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck,
  b.diagnostics.zsh,
  b.formatting.shfmt,

  -- c/cpp
  b.formatting.clang_format,
  b.code_actions.gitsigns,
  b.code_actions.impl,
  b.completion.luasnip,
  b.completion.vsnip,
  -- b.diagnostics.clang_check, -- The clangd is already checking in lspconfig.lua,
  --                               adding these causes redundant messages.
  -- b.diagnostics.cppcheck,
  -- b.diagnostics.cpplint,

  -- Git
  b.diagnostics.gitlint,

  -- Haskell
  b.formatting.stylish_haskell,

  -- Json
  b.diagnostics.jsonlint,

  -- LaTeX
  b.diagnostics.chktex,
  b.formatting.bibclean,
  b.formatting.cmake_format,
  b.formatting.latexindent,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck,
  b.formatting.lua_format,

  -- Make
  b.diagnostics.checkmake,
  b.diagnostics.cmake_lint,

  -- Python
  b.diagnostics.pylama,
  b.formatting.black,

  -- Puppet
  b.formatting.puppet_lint,

  -- Rust
  b.formatting.rustfmt,

  -- Spelling
  b.formatting.codespell,

  -- SQL
  b.formatting.sqlfmt,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

}

null_ls.setup {
  debug = true,
  sources = sources,
}
