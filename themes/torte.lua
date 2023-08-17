-- place the file in /custom/themes/<theme-name>.lua
-- for example: custom/themes/siduck.lua

local M = {}
M.base_30 = {
   -- 30 colors based on base_16
  --------- White ----------
  white         = "#ffffff",
  --------- Black ----------
  black         = "#1a1b26", --  nvim bg
  black2        = "#1f2336",
  darker_black  = "#000000",
  one_bg        = "#dadadb", -- real bg of onedark
  one_bg2       = "#d4d4d5",
  one_bg3       = "#cccccd",
  light_grey    = "#e5e5e5",
  grey          = "#e5e5e5",
  grey_fg2      = "#a9a9a9",
  grey_fg       = "#666666",
  ---------- Red -----------
  red           = "#ff0000",
  baby_pink     = "#DE8C92",
  pink          = "#ff75a0",
  -------- Orange ----------
  orange        = "#ff9e64",
  -------- Yellow ----------
  yellow        = "#ffff00",
  sun           = "#cdcd00",
  --------- Green ----------
  green         = "#00ff00",
  vibrant_green = "#73daca",
  ---------- Blue ----------
  blue          = "#5c5cff",
  nord_blue     = "#0000ee",
  teal          = "#1abc9c",
  cyan          = "#00ffff",
  -------- Indigo ----------
  -------- Violet ----------
  purple        = "#bb9af7",
  dark_purple   = "#9d7cd8",
  --------- ????? ----------
  line          = "#32333e", -- for lines like vertsplit
  one_bg2       = "#414868",
  one_bg        = "#24283b",
  one_bg3       = "#353b45",
  statusline_bg = "#1d1e29",
  lightbg       = "#32333e",
  pmenu_bg      = "#7aa2f7",
  folder_bg     = "#7aa2f7",
}
 
M.base_16 = {
   -- base16 colors
  base00 = "#000000",
  base01 = "#cd0000",
  base02 = "#00cd00",
  base03 = "#cdcd00",
  base04 = "#0000ee",
  base05 = "#cd00cd",
  base06 = "#00cdcd",
  base07 = "#e5e5e5",
  base08 = "#7f7f7f",
  base09 = "#ff0000",
  base0A = "#00ff00",
  base0B = "#ffff00",
  base0C = "#5c5cff",
  base0D = "#ff00ff",
  base0E = "#00ffff",
  base0F = "#ffffff",
}
 
M.type = "dark" -- light / dark
 
M.polish_hl = {
  TelescopeSelection = { bg = M.base_30.orange, fg = M.base_30.white },
  TelescopePromptPrefix = { fg = M.base_30.white },
 
  Normal        = { fg="#cccccc", bg="#222222", gui=NONE },
  Comment       = { bg="#8080ff", fg="#383838", gui=NONE },
  Constant      = { fg="#ffa0a0", bg=NONE,      gui=NONE },
  Identifier    = { fg="#40ffff", bg=NONE,      gui=NONE },
  Statement     = { fg="#ffff60", bg=NONE,      gui=NONE },
  PreProc       = { fg="#ff80ff", bg="NONE",    gui=NONE },
  Type          = { fg="#60ff60", bg="NONE",    gui=NONE },
  Special       = { fg="#ffa500", bg="NONE",    gui=NONE },
  Underlined    = { fg="#80a0ff", bg="NONE",    gui=underline },
  Ignore        = { fg="#000000", bg="#000000", gui=NONE },
  Error         = { fg="#ffffff", bg="#ff0000", gui=NONE },
  Todo          = { fg="#ffff00", bg="#000000"  , gui=reverse },
  Folded        = { fg="#00cdcd", bg="#3a3a3a", gui=NONE },
  Visual        = { fg="#000000", bg="#a9a9a9", gui=bold },
  CursorColumn  = { fg=NONE,      bg="#505050", gui=NONE },
  CursorLine    = { fg=NONE,      bg="#505050", gui=NONE },
  CursorLineNr  = { fg="#ffff00", bg="#2b5070", gui=NONE },
  LineNr        = { fg="#2b5070", bg="#2b5070", gui=NONE },
  SignColumn    = { fg=NONE,      bg="#2b50b0", gui=NONE },
  FoldColumn    = { fg="#00ffff", bg=NONE,      gui=NONE },
  ColorColumn   = { fg="#cccccc", bg="#8b0000", gui=NONE },
  Conceal       = { fg="#e5e5e5", bg="#a9a9a9", gui=NONE },
  Cursor        = { fg="#000000", bg="#00ff00", gui=bold },
  lCursor       = { fg="#000000", bg="#e5e5e5", gui=NONE },
  CursorIM      = { fg=NONE,      bg=fg,        gui=NONE },
  Title         = { fg="#ff00ff", bg=NONE,      gui=bold },
  Directory     = { fg="#00ffff", bg=NONE,      gui=NONE },
  Search        = { fg="#ff0000", bg="#000000", gui=reverse },
  IncSearch     = { fg="#00cd00", bg="#000000", gui=reverse },
  NonText       = { fg="#0000ff", bg=NONE,      gui=bold },
  EndOfBuffer   = { fg="#0000ff", bg=NONE,      gui=bold },
  ErrorMsg      = { fg="#ffffff", bg="#cd0000", gui=NONE },
  WarningMsg    = { fg="#ff0000", bg=NONE,      gui=NONE },
  MatchParen    = { fg=NONE,      bg="#008b8b", gui=NONE },
  ModeMsg       = { fg=NONE,      bg=NONE,      gui=bold },
  MoreMsg       = { fg="#2e8b57", bg=NONE,      gui=bold },
  Question      = { fg="#00ff00", bg=NONE,      gui=bold },
  SpecialKey    = { fg="#00ffff", bg=NONE,      gui=NONE },
  VisualNOS     = { fg=NONE,      bg="#000000", gui=bold,underline },
  WildMenu      = { fg="#000000", bg="#ffff00", gui=NONE },
  QuickFixLine  = { fg="#000000", bg="#cdcd00", gui=NONE },
  SpellBad      = {               bg="#ff0000", gui=underdouble },
  SpellCap      = {               bg="#5c5cff", gui=NONE },
  SpellLocal    = {               bg="#ff00ff", gui=NONE },
  SpellRare     = {               bg="#00ffff", gui=NONE },
  StatusLine    = { fg="#ffffff", bg="#0000ee", gui=bold },
  StatusLineNC  = { fg="#000000", bg="#e5e5e5", gui=NONE },
  VertSplit     = { fg="#000000", bg="#e5e5e5", gui=NONE },
  TabLine       = { fg="#ffffff", bg="#7f7f7f", gui=NONE },
  TabLineFill   = { fg=NONE,      bg="#000000", gui=reverse },
  TabLineSel    = { fg="#cccccc", bg="#000000", gui=bold },
  ToolbarLine   = { fg=NONE,      bg="#000000", gui=NONE },
  ToolbarButton = { fg="#000000", bg="#e5e5e5", gui=bold },
  Pmenu         = { fg=fg,        bg="#303030", gui=NONE },
  PmenuSbar     = { fg=NONE,      bg=NONE,      gui=NONE },
  PmenuSel      = { fg="#000000", bg="#ffff00", gui=NONE },
  PmenuThumb    = { fg=NONE,      bg="#bebebe", gui=NONE },
  DiffAdd       = { fg="#ffffff", bg="#5f875f", gui=NONE },
  DiffChange    = { fg="#ffffff", bg="#5f87af", gui=NONE },
  DiffText      = { fg="#000000", bg="#c6c6c6", gui=NONE },
  DiffDelete    = { fg="#ffffff", bg="#af5faf", gui=NONE },
}

return M
