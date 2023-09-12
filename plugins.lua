local cmd = vim.cmd
local g   = vim.g
local overrides = require("custom.configs.overrides")

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.o.spell = true

-- Custom listchars for indent-blankline
vim.opt.list = true
vim.opt.listchars:append "eol:↴"


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

  --------------------------------------------------------------------
  -- OVERRIDE
  -- PLUGIN:  gitsigns.nvim
  -- GitHub:  lewis6991/gitsigns.nvim
  -- Comment: 
  --------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns
  },

  --------------------------------------------------------------------
  -- OVERRIDE
  -- PLUGIN:  mason.nvim
  -- GitHub:  williamboman/mason.nvim
  -- Comment: Package manager for LSPs.
  --------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  --------------------------------------------------------------------
  -- OVERRIDE
  -- PLUGIN:  nvim-treesitter
  -- GitHub:  nvim-treesitter/nvim-treesitter
  -- Comment: Syntax parser
  --------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
  --------------------------------------------------------------------
  -- OVERRIDE
  -- PLUGIN:  nvim-tree.lua
  -- GitHub:  nvim-tree/nvim-tree.lua
  -- Comment: File system viewer
  --------------------------------------------------------------------
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    
  },

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


    -- Install a plugin

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
  -- PLUGIN:  nvim-dap
  -- GitHub:  https://github.com/mfussenegger/nvim-dap.git
  -- Comment: Debug Adapter Protocol (DAP) client implementation
  --------------------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
  }

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
  -- PLUGIN:  todo-comments.nvim
  -- GitHub:  folke/todo-comments.nvim
  -- Comment: Highlights certain words to grab your attention.date
  --          Words such as TODO, FIXME, etc.
  --------------------------------------------------------------------
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  --------------------------------------------------------------------
  -- PLUGIN:  trouble.nvim
  -- GitHub:  folke/trouble.nvim
  -- Comment: Displays diagnostic information.
  --------------------------------------------------------------------
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
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
  -- PLUGIN:  fidget.nvim
  -- GitHub:  j-hui/fidget.nvim
  -- Comment: TODO: What does this do?
  --------------------------------------------------------------------
    {
      "j-hui/fidget.nvim",
      lazy = false,
      tag = "legacy", -- TODO: remove after rewrite
      config = [[require('config.fidget-nvim')]],
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
  -- Comment: Allows the adjustment of winodw splits.
  --------------------------------------------------------------------
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup()
    end,
  },


  --------------------------------------------------------------------
  -- PLUGIN:  symbols-outline.nvim
  -- GitHub:  simrat39/symbols-outline.nvim
  -- Comment: Adds a window to the right side and display an outline
  --          of the file (symbols, variables, etc.).
  --------------------------------------------------------------------
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
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
}

return plugins
