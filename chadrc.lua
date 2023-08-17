-- local cmd = vim.cmd
-- local g   = vim.g
-- local opt = vim.opt
--*************************************************************************************
-- TODO LIST
--    - TODO: Create a theme that matches the colorscheme 'torte'
--      TODO: Need to look at mappings for the following:
--            1) marks
--            2) symbol-outline
--            3) Telescope (and make cheatsheets)
--            4) Edge: can we use it?
--            5) Trouble
--            6) nvim-hlslens
--            7) vim-obsession
--            8) fidgit
--            9) indent-blankline / nvim-ts-rainbow
--            10 mini.indentscope
--            11) nvim-notify
--            12) smart-splits.nvim
--            13) Fix gq (or see if gw is adequate)
--*************************************************************************************

local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  ------------------------------------------------------------------------------
  -- HIGHLIGHTS
  ------------------------------------------------------------------------------
  hl_override = highlights.override,
  hl_add = highlights.add,

  ------------------------------------------------------------------------------
  -- LSP
  ------------------------------------------------------------------------------
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  ------------------------------------------------------------------------------
  -- STATUSLINE
  ------------------------------------------------------------------------------
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    -- separator_style = "default",
    -- overriden_modules = nil,
  },

  ------------------------------------------------------------------------------
  -- TELESCOPE
  ------------------------------------------------------------------------------
  telescope = { style = "bordered" }, -- borderless / bordered; also in overrides

  ------------------------------------------------------------------------------
  -- THEME
  ------------------------------------------------------------------------------
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "one_light" },

  changed_themes = {
    tokyonight = {
      -- base_16 = {
      --   base00 = "#mycol",
      -- },
      -- base_30 = {
      --   red = "#mycol",
      --   white = "#mycol",
      -- },
      polish_hl = {
        TelescopeSelection = { bg = "#ff9e64", fg = "#222222" },
        TelescopePromptPrefix = { fg = "#ffffff" },
        CursorColumn  = { fg=NONE,      bg="#505050", gui=NONE },
        CursorLine    = { fg=NONE,      bg="#505050", gui=NONE },
        CursorLineNr  = { fg="#ffff00", bg="#1b3050", gui=bold },
        LineNr        = { fg="#666666", bg="#2b4060", gui=NONE },
        SignColumn    = { fg=NONE,      bg="#2b50b0", gui=NONE },
      },

    },

    tokyonight = {
      -- base_16 = {
      --   base00 = "#mycol",
      -- },
      -- base_30 = {
      --   red = "#mycol",
      --   white = "#mycol",
      -- },
      polish_hl = {
        TelescopeSelection = { bg = "#ff9e64", fg = "#222222" },
        TelescopePromptPrefix = { fg = "#ffffff" },
        CursorColumn  = { fg=NONE,      bg="#505050", gui=NONE },
        CursorLine    = { fg=NONE,      bg="#505050", gui=NONE },
        CursorLineNr  = { fg="#ffff00", bg="#1b3050", gui=bold },
        LineNr        = { fg="#666666", bg="#2b4060", gui=NONE },
        SignColumn    = { fg=NONE,      bg="#2b50b0", gui=NONE },
      },

    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
