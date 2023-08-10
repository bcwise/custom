-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}


---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },

  -- The number column
  LineNr       = { bg = "black",
                   fg = "#2b506e"},
  CursorLineNr = { gui = bold, bg = "Black", fg = "yellow"},
  CursorLine   = { gui = bold, bg = "#888888"},
  CursorColumn = { gui = bold, bg = "#888888"},

  -- SignColumn   = { gui = bold, bg = "#2b506e", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#2b506e", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#34495E", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#193563", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#142a4f", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#0c192d", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#092147", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#05152e", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#071d40", fg = "LightGray"},
  -- SignColumn   = { gui = bold, bg = "#051d45", fg = "LightGray"},
  SignColumn   = { gui = bold, bg = "#202c40", fg = "LightGray"},
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
