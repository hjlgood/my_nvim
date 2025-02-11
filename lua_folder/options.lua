--------------------------------------------------------------------------
-- Vim options
--------------------------------------------------------------------------

--use Unicode
vim.opt.encoding = 'utf-8'
--set Font
--vim.opt.guifont = "Meslo_LG_S_for_Powerline:h9"

--Search recursively downward from CWD; provides TAB completion for filenames
--e.g., `:find vim* <TAB>`
-- vim.opt.path+=**

--number of lines at the beginning and end of files checked for file-specific vars
vim.opt.modelines = 0

--reload files changed outside of Vim not currently modified in Vim (needs below)
--use :e to update
vim.opt.autoread = true
-- " http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
-- au FocusGained,BufEnter * :silent! !

--errors flash screen rather than emit beep
vim.opt.visualbell = false

--make Backspace work like Delete
vim.opt.backspace="indent,eol,start"

--line numbers and distances
--set relativenumber 
vim.opt.number = true

--number of lines offset when jumping
vim.opt.scrolloff=2

--Tab key enters 2 spaces
--To enter a TAB character when `expandtab` is in effect,
--CTRL-v-TAB
vim.opt.expandtab= true
vim.opt.tabstop=4 
vim.opt.shiftwidth=4 
vim.opt.softtabstop=4 

--Indent new line the same as the preceding line
vim.opt.autoindent = false

--statusline indicates insert or normal mode
vim.opt.showmode  = true

--highlight matching parens, braces, brackets, etc
vim.opt.showmatch = true

--http://vim.wikia.com/wiki/Searching
vim.opt.hlsearch   =true  
vim.opt.incsearch  =true 
vim.opt.ignorecase =true 
vim.opt.smartcase  =true

-- " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
vim.opt.autochdir = true

-- " open new buffers without saving current modifications (buffer remains open)
vim.opt.hidden = true

-- " http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
-- set wildmenu wildmode=list:longest,full
-- 
-- " StatusLine always visible, display full path
-- " http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
vim.opt.laststatus=2 
vim.opt.statusline="%F"

-- " Use system clipboard
-- " http://vim.wikia.com/wiki/Accessing_the_system_clipboard
-- " for linux
vim.opt.clipboard = "unnamed"
vim.opt.clipboard = "unnamedplus"
-- " for macOS
-- " set clipboard=unnamed

-- " Folding
-- " https://vim.fandom.com/wiki/Folding
-- " https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
-- " https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldmethod="indent"  -- indent, syntax, expr, marker, diff
vim.opt.foldnestmax=1
vim.opt.foldlevelstart=1

-- # Deprecated : don't create `filename~` backups
-- vim.opt.nobackup = true

-- # Deprecated : don't create temp files
-- vim.opt.noswapfile = true

-- # Deprecated : drop vi support - kept for vim compatibility but not needed for nvim
-- vim.opt.nocompatible = true

-- # Deprecated : make scrolling and painting fast
--ttyfast kept for vim compatibility but not needed for nvim
-- set ttyfast lazyredraw

-- Add dot at spaces
vim.opt.list = true
vim.opt.listchars = {
--  tab = "» ",
--  trail = "·",
--  extends = "›",
--  precedes = "‹",
--  nbsp = "␣",
  space = "·",
}

-- word wrap
vim.opt.wrap=false
vim.opt.linebreak=true

-- languagetool let g
vim.g.languagetool_jar='$HOME/LanguageTool-5.9/languagetool-commandline.jar'
-- vim.g.languagetool_cmd='java -jar $HOME/Downloads/LanguageTool-6.5/languagetool-commandline.jar'
vim.g.languagetool_lang='en-US'


-- Transparency
-- vim.api.nvim_set_hl(0, "Normal"  ,{bg = "NONE", ctermbg = "NONE"})
-- vim.api.nvim_set_hl(0, "NonText" ,{bg = "NONE", ctermbg = "NONE"})
