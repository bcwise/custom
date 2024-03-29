local M = {}

  --------------------------------------------------------------------
  -- PLUGIN:  cutlass
  -- GitHub:  http://github.com/gdprod/cutlass.nvim
  -- Comment: Controls the sign column(s)
  --------------------------------------------------------------------
M.cutlass = {
  cut_key = 'x',
  override_del = true,
}

  --------------------------------------------------------------------
  -- PLUGIN:  gitsigns
  -- GitHub:  
  -- Comment: Controls the sign column(s)
  --------------------------------------------------------------------
M.gitsigns = {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = 'x' },
    topdelete    = { text = 'X' },
    changedelete = { text = 'x' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true,  -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked     = true,
  current_line_blame      = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text         = true,
    virt_text_pos     = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay             = 500,
    ignore_whitespace = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority    = 6,
  update_debounce  = 100,
  status_formatter = nil, -- Use default
  max_file_length  = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border   = 'double',
    style    = 'minimal',
    relative = 'cursor',
    row      = 0,
    col      = 1
  },
  yadm = {
    enable = false
  },
}


  --------------------------------------------------------------------
  -- PLUGIN:  treesitter
  -- Comment: Treesitter configuration
  --------------------------------------------------------------------
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


  --------------------------------------------------------------------
  -- PLUGIN:  Mason
  -- Comment: LSP plugin manager
  --------------------------------------------------------------------
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
    "codespell",
    "cspell",

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

--------------------------------------------------------------------
-- PLUGIN:  nvim-tree
-- Comment: File explorer
--------------------------------------------------------------------
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

-- local telescope = require("telescope")
-- local lga_actions = require("telescope-live-grep-args.actions")
-- M.telescope = {
--   extensions = {
--     live_grep_args = {
--       auto_quoting = true, -- enable/disable auto-quoting
--       -- define mappings, e.g.
--       mappings = { -- extend mappings
--         i = {
--           ["<C-k>"] = lga_actions.quote_prompt(),
--           ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
--         },
--       },
--       -- ... also accepts theme settings, for example:
--       theme = "dropdown", -- use dropdown theme
--       -- theme = { }, -- use own theme spec
--       -- layout_config = { mirror=true }, -- mirror preview pane
--     }
--   }
--
-- }


  --------------------------------------------------------------------
  -- PLUGIN:  which-key
  -- GitHub:  folke/which-key.nvim
  -- Comment: Displays a popup with possible key bindings of the
  --          of the command that you started typing.
  --------------------------------------------------------------------
M.which_key = {
  n = { "e", "w" },
  v = { "e", "w" },
}


return M
