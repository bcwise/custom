---@type mappingsTable
local M = {}

M.general = {
  n = {
    ["<C-Space>"] = { "<Cmd>CtrlSpace<CR>", "Opens up the CtrlSpace window with the current buffers.", opts = { nowait = true } },
    -- ["ga"] = { "<Cmd>EasyAlign<CR>", "Calls up the EasyAlign program to align your code."},

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


    -- Mapping: EasyAlignment
    ["ea"] = { "<Plug>(EasyAlign)", "Calls up the EasyAlign program to align your code."},

    -- Mappings: Telescope
    ["<leader>fg"]    = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fp"]    = { "<cmd>lua require('telescope.builtin').planets()<cr>", "" },
    ["<leader>fq"]    = { "<cmd>lua require('telescope.builtin').quickfix()<cr>", "Show quickfix contents" },
    ["<leader>fr"]    = { "<cmd>lua require('telescope.builtin').registers()<cr>", "Show register contents" },
    ["<leader>fs"]    = { "<cmd>lua require('telescope.builtin').find_string()<cr>", "Find a string" },
    ["<leader>ft"]    = { "<cmd>lua require('telescope.builtin').tags()<cr>", "Display help tags" },
    ["<leader>fts"]   = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Display Treesitter info" },
    ["<leader>fw"]    = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Search for the string under the cursor" },
-- Find LSP...
    ["<leader>flr"]   = { "<cmd> Telescope lsp_references <CR>", "LSP References", "Show LSP references" },
    ["<leader>flds"]  = { "<cmd> Telescope lsp_document_symbols <CR>", "Show LSP symbols for the current document" },
    ["<leader>flws"]  = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Show workspace symbols" },
    ["<leader>fldws"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Show LSP dynamic workspace symbols" },
    ["<leader>fd"]    = { "<cmd> Telescope diagnostics <CR>", "Show diagnostics" },
    ["<leader>fli"]   = { "<cmd> Telescope lsp_implementations <CR>", "Show LSP implementations" },
    ["<leader>fld"]   = { "<cmd> Telescope lsp_definitions <CR>", "Show LSP definitions" },
    ["<leaderfltd"]   = { "<cmd> Telescope lsp_type_definitions <CR>", "Show LSP type definitions" },

  },

  v = {

    -- Stay in visual mode after '<' or '>'
    ["<"] = { "<gv" , "Remain in visual mode after '<' " },
    [">"] = { ">gv" , "Remain in visual mode after '>' " },

    -- Make * and # work with visual selection
    -- ["*"] = { "yq/i\V<Esc>p<CR>", "Make * work with a visual selection." },
    -- ["#"] = { "yq?i\V<Esc>p<CR>", "Make # work with a visual selection." },


    -- Repeat last action for each line in the visual selection
    ["."] = {":normal .<CR>", "Repeat last action for each line in the visual selection."},
  },

  x = {
    ["ea"] = { "<Plug>(EasyAlign)", "Calls up the EasyAlign program to align your code."}
  }

}

-- more keybinds!

return M
