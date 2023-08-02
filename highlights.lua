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
  CursorLine   = { fg = "white", bg = "lightgray"},

  SignColumn   = { gui = bold, bg = "#2b506e", fg = "LightGray"},
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
