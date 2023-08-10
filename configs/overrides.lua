local M = {}

M.treesitter = {
  style = "bordered", -- borderless / bordered; also in chadrc
  preview = 
  {
      treesitter = true,
  },
  ensure_installed = {
    "arduino",
    "bash",
    "bibtex",
    "c",
    "cmake",
    "cpp",
    "css",
    "diff",
    "erlang",
    "git_config",
    "gitignore",
    "haskell",
    "html",
    "java",
    "javascript",
    "json",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "perl",
    "puppet",
    "python",
    "regex",
    "rust",
    "sql",
    "tsx",
    "typescript",
    "vim",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- Arduino
    "arduino-language-server",

    -- AWK
    "awk-language-server",

    -- BASH/Shells
    "bash-language-server",
    "shellcheck",
    "shfmt",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cpplint",

    -- Docker files
    "dockerfile-language-server",

    -- erlang
    "erlang-ls",

    -- HTML
    "html-lsp",
    "htmlbeautifier",

    -- Impl
    "impl",

    -- Java
    "java-language-server",

    -- latex
    "latexindent",
    "texlab",

    -- lua stuff
    "lua-language-server",
    "luacheck",
    "luaformatter",
    "stylua",

    -- Make
    "cmake-language-server",
    "cmakelint",
    "make-language-server",

    -- Python
    "pyflakes",
    "pylama",
    "pylint",
    "pylyzer",
    "pyright",
    "python-lsp-server",

    -- Rust
    "rust-analyzer",
    "rustfmt",

    -- Spell

    -- SQL
    "sql-formatter",
    "sqlfmt",
    "sqlls",

    -- vim
    "vim-language-server",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    width = 35,
  },

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
}

return M
