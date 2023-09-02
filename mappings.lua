---@type mappingsTable

-- Notes
--    Speeddating does it's own mappings; therefore, it's not necessary to do them here.


-- require'telescope.builtin'.planets{}

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

  -- Move current line up and down
  -- ["<A-k>"]  = {'<cmd>call utils#SwitchLine(line("."), "up")<cr>', "Move line up" },
  -- ["<A-j>"]  = {'<cmd>call utils#SwitchLine(line("."), "down")<cr>', "Move line down" },

    -- Plugin: EasyAlign (it wouldn't work if we made a separate category)
    ["ea"] = { "<Plug>(EasyAlign)", "Align your code."},

    -- Plugin: SmartSplits (wouldn't work in it's own category)
    ["<C-Up>"]    = { "<Cmd>SmartResizeUp<CR>",    "Resize split up"    },
    ["<C-Down>"]  = { "<Cmd>SmartResizeDown<CR>",  "Resize split down"  },
    ["<C-Left>"]  = { "<Cmd>SmartResizeLeft<CR>",  "Resize split left"  },
    ["<C-Right>"] = { "<Cmd>SmartResizeRight<CR>", "Resize split right" },

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
    ["."] = {":normal .<CR>", "Repeat last action for each line in the visual selection."},

    -- Word-wrap documents
    -- Use internal formatting for bindings like gq.
    -- ["gq"] = {vim.api.nvim_create_autocmd('LspAttach', { callback = function(args) vim.bo[args.buf].formatexpr = nil, end }), "Repeat last action for each line in the visual selection."},
  },

  x = {
    --****************************************************************
    -- General Settings: X
    --****************************************************************
    -- Move current visual-line selection up and down
    ["<A-k>"] = {'<cmd>call utils#MoveSelection("up")<cr>', "Move selection up" },
    ["<A-j>"] = {'<cmd>call utils#MoveSelection("down")<cr>', "Move selection down" },


    -- Plugin: EasyAlign (it wouldn't work if we made a separate category)
    ["ea"] = { "<Plug>(EasyAlign)", "Align your code."},
  }
-- more keybinds!
}


--------------------------------------------------------------------------------
-- Plugin: LSPConfig
--------------------------------------------------------------------------------
M.lspconfig = {
  plugin = true,

  n = {
    -- LSP (buffer commands)--
    -- ["ci"] = { function() require'telescope.builtin'.lsp_incoming_calls() end, "LSP incoming calls to the given function", },
    ["ci"] = { function() vim.lsp.buf.incoming_calls() end, "LSP incoming calls to the given function", },
    ["co"] = { function() vim.lsp.buf.outgoing_calls() end, "LSP outgoing calls from the given function", },

    -- Code Actions:
    -- ["<ca"]         = { function() vim.lsp.buf.code_action() end,  "LSP code action",},

    -- Definitions
    -- ["gd"]         = { function() vim.lsp.buf.definition() end,  "LSP Definition",},
    -- ["gD"]         = { function() vim.lsp.buf.declaration() end, "LSP Declaration",},
    -- ["gi"]         = { function() vim.lsp.buf.implementation() end, "LSP implementation",},
    -- ["gr"]         = { function() vim.lsp.buf.references() end, "LSP references", },
    ["gt"]            = { function() vim.lsp.buf.type_definition() end, "LSP definition type",},

    -- LSP: diagnostics
    ["df"]            = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic", },
    ["dl"]            = { function() vim.diagnostic.setloclist() end, "Diagnostic setloclist", },
    -- ["[d"]         = { function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, "Goto prev", },
    -- ["]d"]         = { function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, "Goto next", },

    -- Signature
    ["K"]             = { function() vim.lsp.buf.hover() end,       "LSP Declaration",},
    ["sh"]            = { function() vim.lsp.buf.signature_help() end, "LSP signature help",},

    -- Workspace
    ["wa"]            = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder", },
    ["wr"]            = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder", },
    ["wl"]            = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders", },
  },
}




--------------------------------------------------------------------------------
-- Plugin: Symbols-Outline
--------------------------------------------------------------------------------
M.SymbolsOutline = {
  n = {
    ["<leader>o"]  = { "<Cmd>SymbolsOutline<CR>", "Toggles Symbol Outline."},
  },
}


--------------------------------------------------------------------------------
-- Plugin: Telescope
--------------------------------------------------------------------------------
M.telescope = {
  plugin = true,

  n = {
    -- These commented out mappings are already defined by NvChad:
    -- ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    -- ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    -- ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    -- ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    -- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    -- ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- find --
    ["<leader>fg"]   = { "<Cmd> Telescope live_grep <CR>",   "Live grep" },
    ["<leader>fq"]   = { "<Cmd> Telescope quickfix <CR>",    "Show quickfix contents" },
    ["<leader>fr"]   = { "<Cmd> Telescope registers <CR>",   "Show register contents" },
    ["<leader>fs"]   = { "<Cmd> Telescope find_string <CR>", "Find a string" },
    ["<leader>ft"]   = { "<Cmd> Telescope tags <CR>",        "Display help tags" },
    ["<leader>fts"]  = { "<Cmd> Telescope treesitter <CR>",  "Display Treesitter info" },
    ["<leader>fw"]   = { "<Cmd> Telescope grep_string <CR>", "Search for the string under the cursor" },

    -- Find git --
    ["<leader>gc"]   = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"]   = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gb"]   = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gst"]  = { "<cmd> Telescope git_stash <CR>", "Git list stashed items" },

    ["<leader>lr"]   = { "<Cmd> Telescope lsp_references <CR>",                "LSP References", "Show LSP references" },
    ["<leader>lds"]  = { "<Cmd> Telescope lsp_document_symbols <CR>",          "Show LSP symbols for the current document" },
    ["<leader>lws"]  = { "<Cmd> Telescope lsp_workspace_symbols <CR>",         "LSP: Show workspace symbols" },
    ["<leader>ldws"] = { "<Cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Show LSP dynamic workspace symbols" },
    ["<leader>ld"]   = { "<Cmd> Telescope diagnostics <CR>",                   "Show diagnostics" },
    ["<leader>li"]   = { "<Cmd> Telescope lsp_implementations <CR>",           "Show LSP implementations" },
    ["<leader>ld"]   = { "<Cmd> Telescope lsp_definitions <CR>",               "Show LSP definitions" },
    ["<leader>lt"]   = { "<Cmd> Telescope lsp_type_definitions <CR>",          "Show LSP type definitions" },

    -- Miscellaneous --
    -- ["<leader>ra"]    = { function() require("nvchad.renamer").open() end, "LSP rename" },
  },
}


--------------------------------------------------------------------------------
-- Plugin: Trouble
--------------------------------------------------------------------------------
M.Trouble = {
  plugin = true,

  n = {
    ["<leader>xx"] = {"<Cmd>TroubleToggle<CR>",                       "Trouble toggle list window"},
    ["<leader>xw"] = {"<Cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics"},
    ["<leader>xd"] = {"<Cmd>TroubleToggle document_diagnostics<CR>",  "Document  diagnostics"},
    ["<leader>xq"] = {"<Cmd>TroubleToggle quickfix<CR>",              "Quickfix"},
    ["<leader>xl"] = {"<Cmd>TroubleToggle loclist<CR>",               "Location list"},
    ["<leader>xr"] = {"<Cmd>TroubleToggle lsp_references<CR>",        "LSP references"},
  },
}


return M

