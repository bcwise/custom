-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "                   COLOR INFORMATION
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--term={attr-list}           *attr-list* *highlight-term* *E418*
--    attr-list is a comma separated list (without spaces) of the
--    following items (in any order):
--        bold
--        underline
--        undercurl   not always available
--        reverse
--        inverse     same as reverse
--        italic
--        standout
--        NONE        no attributes used (used to reset it)
--
--    Note that "bold" can be used here and by using a bold font.  They
--    have the same effect.
--    "undercurl" is a curly underline.  When "undercurl" is not possible
--    then "underline" is used.  In general "undercurl" is only available in
--    the GUI.  The color is set with |highlight-guisp|.
--
--
--*cterm-colors*
--        NR-16   NR-8    COLOR NAME 
--        0       0       Black
--        1       4       DarkBlue
--        2       2       DarkGreen
--        3       6       DarkCyan
--        4       1       DarkRed
--        5       5       DarkMagenta
--        6       3       Brown, DarkYellow
--        7       7       LightGray, LightGrey, Gray, Grey
--        8       0*      DarkGray, DarkGrey
--        9       4*      Blue, LightBlue
--        10      2*      Green, LightGreen
--        11      6*      Cyan, LightCyan
--        12      1*      Red, LightRed
--        13      5*      Magenta, LightMagenta
--        14      3*      Yellow, LightYellow
--        15      7*      White
--
--The number under "NR-16" is used for 16-color terminals ('t_Co'
--    greater than or equal to 16).  The number under "NR-8" is used for
--    8-color terminals ('t_Co' less than 16).  The '*' indicates that the
--    bold attribute is set for ctermfg.  In many 8-color terminals (e.g.,
--    "linux"), this causes the bright colors to appear.  This doesn't work
--    for background colors!  Without the '*' the bold attribute is removed.
--    If you want to set the bold attribute in a different way, put a
--    "cterm=" argument AFTER the "ctermfg=" or "ctermbg=" argument.  Or use
--    a number instead of a color name.
--
--
--guifg={color-name}
--guibg={color-name}
--guisp={color-name}
--    These give the foreground (guifg), background (guibg) and special
--    (guisp) color to use in the GUI.  "guisp" is used for undercurl.
--    There are a few special names:
--        NONE        no color (transparent)
--        bg          use normal background color
--        background  use normal background color
--        fg          use normal foreground color
--        foreground  use normal foreground color
--    To use a color name with an embedded space or other special character,
--    put it in single quotes.  The single quote cannot be used then.
--    Example:
--        :hi comment guifg='salmon pink'
--
--                            *gui-colors*
--    Suggested color names (these are available on most systems):
--        Red     LightRed     DarkRed
--        Green   LightGreen   DarkGreen   SeaGreen
--        Blue    LightBlue    DarkBlue    SlateBlue
--        Cyan    LightCyan    DarkCyan
--        Magenta LightMagenta DarkMagenta
--        Yellow  LightYellow  Brown       DarkYellow
--        Gray    LightGray    DarkGray
--        Black   White
--        Orange  Purple       Violet


local opt = vim.opt
local g = vim.g
--g:python3_host_prog = '/usr/bin/python3'
--g:python2_host_prog = '/usr/bin/python2'

g.mapleader = ','

--===================================================================
--= Basic settings that need to be done early.
--= ===================================================================
opt.compatible = false     -- Eliminate vi backwards-compatability
opt.number = true              -- Enable line numbers
opt.numberwidth = 2
--filetype plugin on          -- required!
--filetype indent on          -- required!
--opt.syntax on               -- Syntax highlighting





-- Tabs
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

-- Case sensitivity
-- change fillchars for folding, vertical split, end of buffer, and message separator
-- set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- opt.matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

-- opt.fileencoding = utf-8
-- opt.fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

g.linebreak = true
g.showbreak = '↪'

g.scrolloff=5

g.showmode = false

g.visualbell = false

-- g.matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》




