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

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

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

--   If you load vim-ctrlspace, it causes a side effect
  --   that when you load multiple files from the command
  --   line (e.g. nvim *.cpp), only the first file has syntax highlighting,
  --   the remainder of the files, the filetype is unknown (unless you run it manually again).
  --   The workaround is to use  Telescope (<leader>fb : show buffers (the same thing as ctrlspace))
--   {
--     "vim-ctrlspace/vim-ctrlspace",
--     lazy = false,
--     config = function()
--       require("custom.configs.ctrlspace")
--     end,
--   },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin

  -- NVCHAD's example of adding a better escape handler.
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Central.vim: manages your backup, swap, and undo directories and files.
  {
    "her/central.vim",
    lazy = false,
    config = function()
      cmd("let g:central_cleanup_enable = 30")
      cmd("let g:central_multiple_backup_enable = 50")
    end,
  },
  -- DeleteTrailingWhitespace.
  -- Adds the function to delete trailing whitespace:while
  -- DeleteTrailingWhitespace.
  {
     "vim-scripts/deletetrailingwhitespace",
    lazy = false,
  },

  {
    "junegunn/vim-easy-align",
    lazy = false,
  },

  {
    "sainnhe/edge",
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
  },

  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
    -- config = function()
    --     require("user.plugins.config.others").gutentags()
    -- end,
    ft = {
        "tex",
        "bib",
    },
  },


  {
    -- TODO: configure setup
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    config = function()
      require("hlslens").setup()
    end,
  },

    -- Session management plugin
  -- TODO: configure, setup
    {
      "tpope/vim-obsession",
      cmd = "Obsession"
    },

    {
      "j-hui/fidget.nvim",
      lazy = false,
      tag = "legacy", -- TODO: remove after rewrite
      config = [[require('config.fidget-nvim')]],
    },

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


  -- Rainbow indent plugin
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

  -- Rainbow brackets plugin
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("indent_blankline").setup {
        use_treesitter = true,
        space_char_blankline = " ",
        show_current_context_start = true,
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
        show_current_context = false,
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

  {
    "rcarriga/nvim-notify",
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


  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
    end,
  },


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
