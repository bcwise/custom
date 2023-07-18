local cmd = vim.cmd
local g   = vim.g
local overrides = require("custom.configs.overrides")

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

  -- override plugin configs
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
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "vim-ctrlspace/vim-ctrlspace",
    lazy = false,
    config = function()
      cmd( "let g:CtrlSpaceDefaultMappingKey = '<C-space> ' " )
    end,
  },

  {
    "junegunn/vim-easy-align",
    lazy = false,
  },

  {
    "sainnhe/edge",
  },

  -- {
  --   "ludovicchabant/vim-gutentags",
  --   lazy = false,
  --   -- config = function()
  --   --     require("user.plugins.config.others").gutentags()
  --   -- end,
  --   ft = {
  --       "tex",
  --       "bib",
  --   },
  -- },

  {
    'wfxr/minimap.vim',
    lazy = false,
    build = "cargo install --locked code-minimap",
    -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function ()
      g.minimap_width                       = 10
      g.minimap_auto_start                  = 1
      g.minimap_auto_start_win_enter        = 1
      g.minimap_highlight_search            = 1
      g.minimap_git_colors                  = 1
      g.minimap_enable_highlight_colorgroup = 1
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
