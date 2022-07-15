local M = {}

M.general = {

   n = {
        -- This mapping allows us to press <enter> to search for the current
        -- token under the cursor without stepping to the next match (like # or *)
        -- and set the highlight.
        -- The second incantation does the same thing, except it does not do a word search.
        -- Fix the one below for FreeBSD
        -- ['<CR>'] = {"<cmd>:let @/='\<<C-R>=expand('<cword>')<CR>\>'<CR>:set hls<CR>", "CR - Search"},
        -- ['<CR>'] = {"<cmd> :let @ /= '<C-R>=expand(<cword>)<CR>' ", "CR - Search"},
        -- ['<CR>'] = {"<cmd> :let @ /= '<C-R>=expand(<cword>)<CR>'<CR>:set hls<CR>", "CR - Search"},
        --:nnoremap <silent><CR>  :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls
        -- ['F10']= {"<cmd>:let @/='<C-R>=expand('<cword>')<CR>'<CR>:set hls<CR>", "CR - Search"},
        -- ['F10']= {"<cmd> :let @/ = '<C-R>=expand(<cword>)<CR>'<CR>:set hls<CR>", "CR - Search"},

        -- Shortcuts: search/replace
        -- A function is for replacing the current-under-cursor word with
        -- another pattern/word. Simply, it copies the word under cursor and inserts it
        -- into a substitution command call. You only need to type the replacement pattern
        -- and press the Enter key to actually replace the text:
        -- replace the word under cursor
        -- Select 's' to search/replace
        -- [;] = {":%s/\<<c-r><c-w>\>//g<left><left>", "Globally replace all"}
        -- nmap ; :%s/\<<c-r><c-w>\>/
        -- [';'] = {"<cmd> :%s/<c-r><c-w>//g<left><left><CR>", "Globally replace all"}
        [';'] = {"<cmd> :%s/<C-R>_<C-W>//g<CR>", "Globally replace all"}

        -- Shortcuts: Substitute
        -- Setup command to replace current word with last yanked, cut, etc. word.
        -- Select "S" to replace
        -- [S] = {"<cmd> :let @x=@'<CR>'_diw"xP", "S to select for global replace"},
        -- ['S'] = {"<cmd> :let @x=@'<CR>'_diwxP", "S to select for global replace"},


   }
}
M.ctrlspace = {
   n = {
      ["<C-space>"] = {"<cmd> :CtrlSpace<CR>", "CtrlSpace"},
   },
   v = {
      ["<C-space>"] = {"<cmd> :CtrlSpace<CR>", "CtrlSpace"},
   },
}

M.nvimtree = {
   n = {
      -- toggle
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
   },
}

M.neogit = {
  n = {
    ["<leader>gg"] = {"<cmd> Neogit <CR>", "neogit"}
  }
}

M.telescope = {
  n = {
    ["<leader><leader>"] = {"<cmd> Telescope find_files <CR>", "find files"},
    ["<leader>x"] = {"<cmd> Telescope commands <CR>", "commands"},
    ["<leader>bb"] = {"<cmd> Telescope buffers <CR>", "find buffers"},
    ["<leader>bd"] = {"<cmd> bdelete <CR>", "delete buffer"},
    ["<leader>bn"] = {"<cmd> enew <CR>", "new buffer"},
    ["<leader>pp"] = {"<cmd> Telescope projects <CR>", "switch project"},
    ["<leader>/"] = {"<cmd> Telescope live_grep <CR>", "grep project"}
  }
}

M.tests = {
  n = {
    ["<leader>tt"] = {"<cmd> Other test<CR>", "test file"},
    ["<leader>tv"] = {"<cmd> TestFile <CR>", "test file"},
    ["<leader>ta"] = {"<cmd> TestSuite <CR>", "test project"},
    ["<leader>ts"] = {"<cmd> TestNearest <CR>", "test nearest"},
  }
}

M.lsp = {
  n = {
    ["<leader>cd"] = {"<cmd> Telescope lsp_definitions <CR>", "lsp definition"},
    ["<leader>cr"] = {"<cmd> Telescope lsp_references <CR>", "lsp references"},
    ["<leader>cs"] = {"<cmd> Telescope lsp_document_symbols <CR>", "lsp document symbols"},
    ["<leader>cw"] = {"<cmd> Telescope lsp_workspace_symbols <CR>", "lsp workspace symbols"},
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp action",
    },
    ["<leader>cR"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "lsp rename",
    },
  }
}

M.eval = {
  n = {
    ["<leader>eb"] = {"<cmd> ConjureEvalBuf <CR>", "eval buffer"},
    ["<leader>ef"] = {"<cmd> ConjureEvalCurrentForm <CR>", "eval current form"},
    ["<leader>er"] = {"<cmd> ConjureEvalRootForm <CR>", "eval root form"},
    ["<leader>ev"] = {"<cmd> ConjureEvalVisual <CR>", "eval visual"},
    ["<leader>ew"] = {"<cmd> ConjureEvalWord <CR>", "eval word"},
    ["<leader>e!"] = {"<cmd> ConjureEvalReplaceForm <CR>", "eval and replace form"},
    ["<leader>et"] = {"<cmd> ConjureCljRunCurrentNsTests <CR>", "Run NS tests"},
    ["<leader>eT"] = {"<cmd> ConjureCljRunAllTests <CR>", "Run all tests"},
  }
}

M.nav = {
  n = {
    ["<C-a>"] = {"<cmd> bprevious <CR>", "previous buffer"},
    ["<C-d>"] = {"<cmd> bnext <CR>", "next buffer"},
    ["<leader>wv"] = {"<cmd> vsplit <CR>", "split vertical"},
    ["<leader>wh"] = {"<cmd> split <CR>", "split horizontal"},
    ["<leader>wd"] = {"<cmd> close <CR>", "close window"},
    ["<leader>gb"] = {"<cmd> Telescope git_branches <CR>", "git branches"},
    ["<leader>o"] = {"<cmd> Other<CR>", "other file"},
  },
}

M.winresizer = {
   n = {
      ["<leader>w"] = { "<cmd> WinResizerStartResize<CR>", "   WinResizer" },
   },
}

-- M.disabled = {
--    n = {
--       ["<leader>e"] = ""
--    }
-- }

return M
