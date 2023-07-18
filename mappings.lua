---@type mappingsTable
local M = {}

M.general = {
  n = {
    --****************************************************************
    -- General Settings: Normal
    --****************************************************************

    -- Search results centered
    ["n"]  = { "nzz", "Searches and centers the results."},
    ["N"]  = { "Nzz", "Searches and centers the results."},
    ["*"]  = { "*zz", "Searches and centers the results."},
    ["#"]  = { "#zz", "Searches and centers the results."},
    ["g*"] = { "g*zz", "Searches and centers the results."},
    ["g#"] = { "G#zz", "Searches and centers the results."},


--[";"]    = ":%s/\\<<c-r><c-w>\\>//g<left><left>"
--["<CR>"] = ":let @/=expand('<cword>')<CR>:set hls<CR>"
--["S"]    = ':let @x=@"<CR>"_diw"xP'
    ["<CR>"] = { ":let @/=expand('<cword>')<CR>:set hls<CR>", "<Enter> selects for searching the current word under the cursor."},

-- " Shortcuts: search/replace
-- " A function is for replacing the current-under-cursor word with
-- " another pattern/word. Simply, it copies the word under cursor and inserts it
-- " into a substitution command call. You only need to type the replacement pattern
-- " and press the Enter key to actually replace the text:
    [";"] = { ":%s/<C-r><C-w>//g<Left><Left>", "Search/replace everywhere for the word under the cursor."},

-- " Shortcuts: Substitute
-- " Setup command to replace current word with last yanked, cut, etc. word.
-- " Select "S" to replace
    ["S"] = { "ciw<C-r>0<Esc>", "Replace word under cursor." },

    -- Use the <Enter> key to select the whole word under the cursor.
--["<CR>"] = { "viwy   y/\V<C-R>"<CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--    ["<CR>"] = { "viwy/\V<C-R><CR> :let @/ = '\V'<CR>", "Select the whole word under the cursor"},
--TODO(fix):--    ["<CR>"] = { "viwy :let @/ = '\V'<CR>", "Select the whole word under the cursor"},

    -- Remove trailing whitespace characters
    ["<leader>-S"]   = {"<leader><space>", "<cmd>DeleteTrailingWhitespace<cr>", "Remove trailing space" },


    ------------------------------------------------------------------
    -- Plugin (Mode: N): Ctrl-Space
    ------------------------------------------------------------------
    ["<C-Space>"] = { "<Cmd>CtrlSpace<CR>", "Opens up the CtrlSpace window with the current buffers.", opts = { nowait = true } },

    ------------------------------------------------------------------
    -- Plugin (Mode: N): EasyAlign
    ------------------------------------------------------------------
    ["ea"] = { "<Plug>(EasyAlign)", "Calls up the EasyAlign program to align your code."},

    ------------------------------------------------------------------
    -- Plugin (Mode: N): MiniMap
    ------------------------------------------------------------------
    ["<leader>mm"] = { "<Cmd>MinimapToggle<CR>", "Toggles the mini map."},

    ------------------------------------------------------------------
    -- Plugin (Mode: N): Telescope
    ------------------------------------------------------------------
    ["<leader>fg"]    = { "<Cmd> Telescope live_grep <CR>",   "Live grep" },
    ["<leader>fp"]    = { "<Cmd> Telescope planets <CR>",     "" },
    ["<leader>fq"]    = { "<Cmd> Telescope quickfix <CR>",    "Show quickfix contents" },
    ["<leader>fr"]    = { "<Cmd> Telescope registers <CR>",   "Show register contents" },
    ["<leader>fs"]    = { "<Cmd> Telescope find_string <CR>", "Find a string" },
    ["<leader>ft"]    = { "<Cmd> Telescope tags <CR>",        "Display help tags" },
    ["<leader>fts"]   = { "<Cmd> Telescope treesitter <CR>",  "Display Treesitter info" },
    ["<leader>fw"]    = { "<Cmd> Telescope grep_string <CR>", "Search for the string under the cursor" },
    -- Find LSP...
    ["<leader>flr"]   = { "<Cmd> Telescope lsp_references <CR>",                "LSP References", "Show LSP references" },
    ["<leader>flds"]  = { "<Cmd> Telescope lsp_document_symbols <CR>",          "Show LSP symbols for the current document" },
    ["<leader>flws"]  = { "<Cmd> Telescope lsp_workspace_symbols <CR>",         "Show workspace symbols" },
    ["<leader>fldws"] = { "<Cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Show LSP dynamic workspace symbols" },
    ["<leader>fd"]    = { "<Cmd> Telescope diagnostics <CR>",                   "Show diagnostics" },
    ["<leader>fli"]   = { "<Cmd> Telescope lsp_implementations <CR>",           "Show LSP implementations" },
    ["<leader>fld"]   = { "<Cmd> Telescope lsp_definitions <CR>",               "Show LSP definitions" },
    ["<leaderfltd"]   = { "<Cmd> Telescope lsp_type_definitions <CR>",          "Show LSP type definitions" },

  -- Move current line up and down
  ["<A-k>"]  = {'<cmd>call utils#SwitchLine(line("."), "up")<cr>', "Move line up" },
  ["<A-j>"]  = {'<cmd>call utils#SwitchLine(line("."), "down")<cr>', "Move line down" },

  },

  v = {
    --****************************************************************
    -- General Settings: Visual
    --****************************************************************

    -- Stay in visual mode after '<' or '>'
    ["<"] = { "<gv" , "Remain in visual mode after '<' " },
    [">"] = { ">gv" , "Remain in visual mode after '>' " },

    -- Make * and # work with visual selection
    -- ["*"] = { "yq/i\V<Esc>p<CR>", "Make * work with a visual selection." },
    -- ["#"] = { "yq?i\V<Esc>p<CR>", "Make # work with a visual selection." },

    -- Repeat last action for each line in the visual selection
    ["."] = {":normal .<CR>", "Repeat last action for each line in the visual selection."}
  },

  x = {
    --****************************************************************
    -- General Settings: X
    --****************************************************************
    -- Move current visual-line selection up and down
    ["<A-k>"] = {'<cmd>call utils#MoveSelection("up")<cr>', "Move selection up" },
    ["<A-j>"] = {'<cmd>call utils#MoveSelection("down")<cr>', "Move selection down" },

    ------------------------------------------------------------------
    -- Plugin (Mode: X): EasyAlign
    ------------------------------------------------------------------
    ["ea"] = { "<Plug>(EasyAlign)", "Calls up the EasyAlign program to align your code."},

  }

-- more keybinds!
}

return M
