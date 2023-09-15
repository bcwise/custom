local cmd = vim.cmd
local g   = vim.g
local opt = vim.opt
local overrides = require("custom.configs.overrides")

opt.termguicolors = true
cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Spelling Options
opt.spell = true
opt.spelllang = { 'en_us' }

-- Custom listchars for indent-blankline
opt.list = true
opt.listchars:append "eol:↴"



---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  --------------------------------------------------------------------
  -- OVERRIDE
  -- PLUGIN:  nvim-lspconfig
  -- GitHub:  neovim/nvim-lspconfig
  -- Comment:
  --------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },


  {
    -- TODO: I can't seem to override the standard configuration and get additional
    --       completion code libraries.   So I have to take the NvChad configuration
    --       and put it here with my changes.
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup(
        {
          lazy = false,
          mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = function(fallback)
              -- Reference: https://github.com/hrsh7th/nvim-cmp/issues/429#issuecomment-954121524
              cmp.abort()
            end,
            ["<Space>"] = function(fallback)
              -- Reference: https://github.com/hrsh7th/nvim-cmp/issues/429#issuecomment-954121524
              cmp.abort()
              fallback()
            end,
            ["<CR>"] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,  -- Don't delete the word to the right
              select = false,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
                -- expand_or_locally_jumpable prevents the snippet from being re-entered.
                --
                -- Reference: https://github.com/L3MON4D3/LuaSnip/issues/799
                --
                -- elseif require("luasnip").expand_or_jumpable() then
                --
                -- There's apparently other approaches that do the same thing which I haven't tried.
                --
                -- e.g. ``region_check_events`` from https://github.com/L3MON4D3/LuaSnip/issues/770
                -- e.g. ``leave_snippet`` from https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
                --
              elseif require("luasnip").expand_or_locally_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end, {
                "i",
                "s",
              }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end, {
                "i",
                "s",
              }),
          },

          sources = cmp.config.sources(
            {
              { name = "buffer", priority = 20 },         -- Complete text from buffers other than the current one
              { name = "calc" },
              { name = "luasnip" },
              { name = "nvim_lua" },
              { name = "cmdline" },
              { name = "nvim_lsp", priority = 90 },       -- And auto-complete from LSPs
              { name = "nvim_lsp_signature_help" },       -- Signature help
              { name = "latex_symbols"},                  --
              { name = "path", priority = 10 },           -- Complete from file paths
              { name = "spell", option = { keep_all_entries = false,
                                           enable_in_context = function()
                                             return require('cmp.config.context').in_treesitter_capture('spell')
                                           end,
                                         }
              },
            }
          ),
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
        }
      )
      local lspconfig    = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
    end,
    dependencies = {
      {
        -- LSP completion sources
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "kdheepak/cmp-latex-symbols",
        "neovim/nvim-lspconfig",
        "python-lsp/python-lsp-server",
        "f3fora/cmp-spell",
      },
    }
  },

  --##############################################################################
  --OVERRIDES
  --##############################################################################
  { "gbprod/cutlass.nvim",             opts = overrides.cutlass     },
  { "lewis6991/gitsigns.nvim",         opts = overrides.gitsigns    },
  { "williamboman/mason.nvim",         opts = overrides.mason       },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter, },
  { "nvim-tree/nvim-tree.lua",         opts = overrides.nvimtree,   },

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = overrides.telescope,
  -- },
  -- {

  -- if you load some function or module within your opt, wrap it with a function
  -- {
  --  "nvim-telescope/telescope.nvim",
  --  opts = {
  --    defaults = {
  --     extension_list = {live_grep_args},
  --      mappings = {
  --        i = {
  --          ["<esc>"] = function(...)
  --              require("telescope.actions").close(...)
  --           end,
  --         },
  --       },
  --     },
  --   },
  --  },


  --############################################################################
  -- INSTALL
  --############################################################################

  --------------------------------------------------------------------
  -- PLUGIN:  central.vim
  -- GitHub:  her/central.vim
  -- Comment: Manages your backup, swap, and undo directories and files.
  --------------------------------------------------------------------
  {
    "her/central.vim",
    lazy = false,
    config = function()
      cmd("let g:central_cleanup_enable = 30")
      cmd("let g:central_multiple_backup_enable = 50")
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  ChatGPT
  -- GitHub:  jackMort/ChatGPT.nvim
  -- Comment: ChatGPT interface
  --------------------------------------------------------------------
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $HOME/secret.txt.gpg",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
  },

  --------------------------------------------------------------------
  -- PLUGIN:  nvim-conv
  -- GitHub:  http://github.com/simonefranza/nvim-conv
  -- Comment: A simple converter that allows you to convert:
  --            numbers from a base to another
  --               * sequences of bytes to a string and vice-versa
  --               * values from one unit to another one (temperature, metric and imperial units, data transfer rate)
  --               * colors between hex, rgb, hslnumbers from a base to another
  --               * sequences of bytes to a string and vice-versa
  --               * values from one unit to another one (temperature, metric and imperial units, data transfer rate)
  --               * colors between hex, rgb, hsl
  --------------------------------------------------------------------
  {
     "simonefranza/nvim-conv",
    lazy = false,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  nvim-dap
  -- GitHub:  https://github.com/mfussenegger/nvim-dap.git
  -- Comment: Debug Adapter Protocol (DAP) client implementation
  --------------------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
  },

  --------------------------------------------------------------------
  -- PLUGIN:  better-escape.nvim
  -- GitHub: max397574/better-escape.nvim
  -- Comment: A better escape handler.
  --------------------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  DeleteTrailingWhitespace.
  -- GitHub:  vim-scripts/deletetrailingwhitespace
  -- Comment: Adds the function to delete trailing whitespace.
  --------------------------------------------------------------------
  {
     "vim-scripts/deletetrailingwhitespace",
    lazy = false,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  vim-easy-align
  -- GitHub:  junegunn/vim-easy-align
  -- Comment: Easily align text
  --------------------------------------------------------------------
  {
    "junegunn/vim-easy-align",
    lazy = false,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  edge
  -- GitHub:  sainnhe/edge
  -- Comment: Theme.
  --------------------------------------------------------------------
  {
    "sainnhe/edge",
  },

  --------------------------------------------------------------------
  -- PLUGIN:  fidget.nvim
  -- GitHub:  j-hui/fidget.nvim
  -- Comment: UI for nvim-lsp progress.  Shows LSP progress in the
  --          lower right hand corner of Neovim's screen.
  --------------------------------------------------------------------
    {
      "j-hui/fidget.nvim",
      lazy = false,
      tag = "legacy", -- TODO: remove after rewrite
      config = [[require('config.fidget-nvim')]],
    },

  --------------------------------------------------------------------
  -- PLUGIN:  nvim-hlslens
  -- GitHub:  kevinhwang91/nvim-hlslens
  -- Comment: Matches...
  --------------------------------------------------------------------
  {
    -- TODO: configure setup
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = function()
      require("hlslens").setup()
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  marks.nvim
  -- GitHub:  chentoast/marks.nvim
  -- Comment: Adds marks functionality, including putting the mark in the sign column.
  --------------------------------------------------------------------
  {
     "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup()
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  vim-obsession
  -- GitHub:  tpope/vim-obsession
  -- Comment: Session management plugin
  --------------------------------------------------------------------
  -- TODO: configure, setup
    {
      "tpope/vim-obsession",
      lazy = false,
      cmd = "Obsession"
    },

  --------------------------------------------------------------------
  -- PLUGIN:  vim-repeat
  -- GitHub:  tpope/vim-repeat
  -- Comment: Repeat vim motions
  --------------------------------------------------------------------
    {
      "tpope/vim-repeat",
      lazy = false,
    },

  --------------------------------------------------------------------
  -- PLUGIN:  Speeddating
  -- GitHub:  tpope/vim-speeddating
  -- Comment: use <C-A> to increment a number
  --              <C-X> to decrement a number
  --------------------------------------------------------------------
    {
      "tpope/vim-speeddating",
      lazy = false,
    },

  --------------------------------------------------------------------
  -- PLUGIN:  todo-comments.nvim
  -- GitHub:  folke/todo-comments.nvim
  -- Comment: Highlights certain words to grab your attention.date
  --          Words such as TODO, FIXME, etc.
  -- NOTE:    The default configuration didn't load, so it's
  --          replicated here.
  --------------------------------------------------------------------
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
        sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error   = { "DiagnosticError", "ErrorMsg",   "#DC2626" },
    warning = { "DiagnosticWarn",  "WarningMsg", "#FBBF24" },
    info    = { "DiagnosticInfo",  "#2563EB"     },
    hint    = { "DiagnosticHint",  "#10B981"     },
    default = { "Identifier",      "#7C3AED"     },
    test    = { "Identifier",      "#FF00FF"     }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
    }
  },


  --------------------------------------------------------------------
  -- PLUGIN:
  -- GitHub:
  -- Comment: Makes a mini-map on the side of the nvim windows and Displays
  --          your file so you know where you are.
  --------------------------------------------------------------------
  -- {
  --   'wfxr/minimap.vim',
  --   lazy = false,
  --   build = "cargo install --locked code-minimap",
  --   -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
  --   config = function ()
  --     g.minimap_width                       = 10
  --     g.minimap_auto_start                  = 1
  --     g.minimap_auto_start_win_enter        = 1
  --     g.minimap_highlight_search            = 1
  --     g.minimap_git_colors                  = 1
  --     g.minimap_enable_highlight_colorgroup = 1
  --   end,
  -- },


  --------------------------------------------------------------------
  -- PLUGIN:  nvim-ts-rainbow
  -- GitHub:  p00f/nvim-ts-rainbow
  -- Comment: Rainbow indent plugin
  --------------------------------------------------------------------
  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  indent-blankline.nvim
  -- GitHub:  lukas-reineke/indent-blankline.nvim
  -- Comment: Rainbow brackets plugin
  --------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("indent_blankline").setup {
        show_current_context_start = true,
        show_current_context       = true,
        show_end_of_line           = true,
        use_treesitter             = true,
        space_char_blankline       = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
        filetype_exclude = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover" },
        buftype_exclude = { "terminal", "nofile" },
        context_patterns = {
          "class",
          "function",
          "method",
          "block",
          "list_literal",
          "selector",
          "^if",
          "^table",
          "if_statement",
          "while",
          "for",
          "loop",
          "fn",
          "func",
        },
      }
    end,
  },


  --------------------------------------------------------------------
  -- PLUGIN:  mini.indentscope
  -- GitHub:  echasnovski/mini.indentscope
  -- Comment:
  --------------------------------------------------------------------
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = false
        end,
      })
    end,
  },

  --------------------------------------------------------------------
  -- PLUGIN:  nvim-notify
  -- GitHub:  rcarriga/nvim-notify
  -- Comment: Puts up notification windows
  --------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    lazy = false,
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    -- init = function()
    --   -- when noice is not enabled, install notify on VeryLazy
    --   local Util = require("lazyvim.util")
    --   if not Util.has("noice.nvim") then
    --     Util.on_very_lazy(function()
    --       vim.notify = require("notify")
    --     end)
    --   end
    -- end,
  },


  --------------------------------------------------------------------
  -- PLUGIN: smart-splits
  -- GitHub:  mrjones2014/smart-splits.nvim
  -- Comment: Allows the adjustment of window splits.
  --------------------------------------------------------------------
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup()
    end,
  },


  --------------------------------------------------------------------
  -- PLUGIN:  vimtex
  -- GitHub:  lervag/vimtex
  -- Comment: Helper for TeX files.
  --------------------------------------------------------------------
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      require("custom.configs.vimtex")
    end,
    ft = {
      "tex",
      "bib",
    },
  },


  -- Removed this to reload the configuration files
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   enabled = false
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- EXTRAS
  { import = "custom.configs.extras.autosave" },
  -- { import = "custom.configs.extras.cutlass" },
  { import = "custom.configs.extras.diffview" },
  { import = "custom.configs.extras.illuminate" },
  { import = "custom.configs.extras.lazygit" },
  { import = "custom.configs.extras.lsplines" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
}


return plugins
