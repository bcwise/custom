local cmd = vim.cmd
local g   = vim.g
local opt = vim.opt

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
g.mapleader = ","

opt.compatible = false          -- Eliminate vi backwards-compatability
cmd( "filetype plugin indent on" )     -- required!
cmd( "syntax on" )              -- Syntax highlighting

--------------------------------------------------------------------
-- Settings: ABBREVIATIONS (typo corrections)
--------------------------------------------------------------------
cmd('cnoreabbrev WQ wq')
cmd('cnoreabbrev Wq wq')
cmd('cnoreabbrev We w')
cmd('cnoreabbrev W  w')
cmd('cnoreabbrev Q  q')
cmd('cnoreabbrev X  x')

--------------------------------------------------------------------
-- Settings: COLOR
--------------------------------------------------------------------
-- Enable true color support. Do not set this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
opt.termguicolors = true
opt.background=dark
opt.winblend=0


--------------------------------------------------------------------
-- Settings: Diff
--------------------------------------------------------------------
cmd( "set diffopt=" )
cmd( "set diffopt+=vertical" )  -- show diff in vertical position
cmd( "set diffopt+=filler" )    -- show filler for deleted lines
cmd( "set diffopt+=closeoff" )  -- turn off diff when one file window is closed
cmd( "set diffopt+=context:3" ) -- context for diff
cmd( "set diffopt+=internal,indent-heuristic,algorithm:histogram" )

--------------------------------------------------------------------
-- Settings: FILES
--------------------------------------------------------------------
-- Ask for confirmation when handling unsaved or read-only files
cmd( "set confirm" )


--------------------------------------------------------------------
-- Settings: FOLD
--------------------------------------------------------------------
cmd( "set nofoldenable" )


--------------------------------------------------------------------
-- Settings: General Setting Options
--------------------------------------------------------------------
cmd( "set autoread" )                           -- Automatically read a file when it is changed from the outside
cmd( "set backspace        =indent,eol,start" ) -- Allow backspacing over everything in insert mode
cmd( "set cursorcolumn" )                       -- Show cursor column (initialized here, but turned on and off in autocmd section)
cmd( "set cursorline" )                         -- Show cursor line (initialized here, but turned on and off in autocmd section)
cmd( "highlight clear CursorColumn" )
cmd( "highlight clear CursorLine" )
cmd( "set history          =10000" )            -- Keep 10000 lines of command history
cmd( "set modelines        =0" )                -- Prevent some security exploits
cmd( "set nostartofline" )                      -- Don't jumpt to the first character when paging
cmd( "set ruler" )                              -- Show the cursor position all the time
cmd( "set showmatch" )                          -- Jumps to the matching brace, etc.
cmd( "set updatetime      =250" )               -- Update after 1/4 second of no activity (check for external file change, etc.)
cmd( "set shada=!,%,'100,<9999,f1,s1000" )
--        shada=| %,<8000,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
--              | | |     |   |   |
--              | | |     |   |   |
--              | | |     |   |   |
--              | | |     |   |   + Max size of an item contentsin Kbytes
--              | | |     |   + file marks 0-9,A-Z are stored
--              | | |     + Max lines saved each register
--              | | + files marks saved
--              | + save/restore buffer list
--              + Save/restore global variables that only contain uppercase letters.
--  history is by default for:
--  "/" Max number of files for which marks are remembered
--  ":" Maximum number of items in the command-line history
--  "0" Max number of items in teh input-line history


--------------------------------------------------------------------
-- Settings: INDENTATION
--------------------------------------------------------------------
opt.autoindent  = true          -- Enable auto indenting on new lines (and be smart about it)
opt.copyindent  = true          -- Copies the indentation from the line above
opt.expandtab   = true          -- By default, we will expand tabs to spaces, turn this off when needed (i.e. a Makefile)
opt.shiftround  = true          -- When at 3 spaces, and hit > ... go to 4, not 7
opt.shiftwidth  = 2
opt.softtabstop = 2
opt.tabstop     = 2

-- opt.nocindent   = true         -- C-indent only works well on c-style languages, bad for normal text.  Turn it on where needed.
-- opt.nosmarttab  = true         -- This is for c-style programs, turn it on when needed.  Causes problems with normal text.

--------------------------------------------------------------------
-- Settings: INPUT
--------------------------------------------------------------------
-- set clipboard+=unnamedplus   " Use system clipboard as default register (fails)
opt.clipboard="unnamed,unnamedplus"   -- Use system clipboard as default register (fails)
opt.confirm = true                           -- Instead of failing after a missing !, ask what to do
cmd( "set display+=lastline" )               -- Display as much as possible of a window's last line
opt.equalalways = false                      -- Don't resize all remaining splits when opening/closing a split
opt.joinspaces = false                       -- Use only one space after '.' when joining lines, instead of two
cmd( "set splitright splitbelow" )           -- Put new vertical splits to the right/below of the current one
opt.virtualedit = "onemore,block"            -- Allow the cursor one beyond last character and everywhere in V-block mode.


cmd( "set formatoptions+=j" )                -- Handle comments when joining lines


--------------------------------------------------------------------
-- Settings: LISTCHARS
--------------------------------------------------------------------
-- listchars
-- tab:\|\
-- trail:·
-- precedes:«
-- extends:»
--set listchars=precedes:«,extends:»,tab:\ \ ,trail:·
opt.listchars = "tab:<->,extends:»,precedes:«,nbsp:␣,trail:·"
opt.list = true


-- --------------------------------------------------------------------
-- -- Settings: MATCHING
-- --------------------------------------------------------------------
-- -- Settings: MATCHING
-- -- Syntax: hi MatchParen cterm=STYLE ctermbg=BGCOL ctermfg=FGCOL
-- -- Styles: bold underline none
-- cmd( "hi MatchParen cterm=NONE,bold ctermfg=green ctermbg=red" )       -- Intensify matching parenthesis
-- -- Set matching pairs of characters and highlight matching brackets
-- cmd( "set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》" )
--
--
--------------------------------------------------------------------
-- Settings: Numbers
--------------------------------------------------------------------
-- Numbers
opt.number      = true
opt.numberwidth = 3
opt.ruler       = true


-- --------------------------------------------------------------------
-- -- Settings: Popup Window
-- --------------------------------------------------------------------
-- -- set pumheight=10  " Maximum number of items to show in popup menu
-- -- set pumblend=10  " pseudo transparency for completion menu
-- -- set winblend=5  " pseudo transparency for floating window


-- --------------------------------------------------------------------
-- -- Settings: Scrolling
-- --------------------------------------------------------------------
cmd( "set sidescroll=10" )
cmd( "set scrolloff=5" )

-- --------------------------------------------------------------------
-- -- Settings: Searching
-- --------------------------------------------------------------------
opt.hlsearch   = true           -- Highlight search
opt.ignorecase = true           -- Ignore case when searching.
opt.incsearch  = true           -- Incremental search
opt.smartcase  = true           -- Searches ignoring case unless an uppercase is pressed.
opt.wrapscan   = false          -- does not wrap back to the beginning for search.


-- --------------------------------------------------------------------
-- -- Settings: Sign Column
-- --------------------------------------------------------------------
opt.signcolumn = "auto:4"


-- --------------------------------------------------------------------
-- -- Settings: WRAP
-- --------------------------------------------------------------------
cmd( "set nowrap" )


--------------------------------------------------------------------
-- Settings: UNDO (BACKUP, and SWAP)
-- The her/central.vim will create the backup, swap, and undo
-- directories and set the flag so that all three will be active.
--------------------------------------------------------------------
cmd( "set undolevels =100000" ) -- Entries of the undo list



M.ui = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
