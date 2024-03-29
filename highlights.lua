-- To find any highlight groups: "<cmd> Telescope highlights" Each highlight
-- group can take a table with variables fg, bg, bold, italic, etc base30
-- variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "#8080cc",
    bg = "#444444",
  },

  -- The number column
  LineNr       = { fg = "#777777",   bg = "#2b506e" },
  CursorLineNr = { fg = "yellow",    bg = "#2b506e", bold = true },
  CursorLine   = {                   bg = "#888888" },
  CursorColumn = {                   bg = "#888888" },
  SignColumn   = { fg = "LightGray", bg = "#202c40" },

  -- GitSigns Highlight Groups
  GitSignsCurrentLineBlame = {   fg = "lightblue", },

  -- Telescope
  TelescopeSelection = { fg = "#22222f", bg = "orange"},

}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
