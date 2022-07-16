-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
   user = function()
       require("custom.options")
   end,
}

local userPlugins = require "custom.plugins"

M.plugins = {
  user = userPlugins,
  override = {
    ["williamboman/nvim-lsp-installer"] = {
      automatic_installation = false
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "lua",
        "vim",
        "ruby",
        "javascript"
      },
      endwise = {
        enable = true,
      },
      indent = {
        enable = true
      }
    }
  },
  remove = {
    "rafamadriz/friendly-snippets"
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

-- chadrc

M.ui = {
   theme = "onedark",
}

M.mappings = require "custom.mappings"

return M
