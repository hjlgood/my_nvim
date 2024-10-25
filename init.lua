
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    -- add your plugins here
	{
	    'AlexvZyl/nordic.nvim',
	    lazy = false,
	    priority = 1000,
	    config = function()
	        require('nordic').load()
	    end
	},
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nordic" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})


--------------------------------------------------------------------------
-- Vim options
--------------------------------------------------------------------------

--drop vi support - kept for vim compatibility but not needed for nvim
--Probably not needed with Vim 8+
-- vim.opt.nocompatible = true

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

--use Unicode
vim.opt.encoding = 'utf-8'

--errors flash screen rather than emit beep
vim.opt.visualbell = false

--make Backspace work like Delete
vim.opt.backspace="indent,eol,start"

-- # Deprecated : don't create `filename~` backups 
-- vim.opt.nobackup = true

-- # Deprecated : don't create temp files     
-- vim.opt.noswapfile = true

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

--make scrolling and painting fast
--ttyfast kept for vim compatibility but not needed for nvim
-- set ttyfast lazyredraw

--highlight matching parens, braces, brackets, etc
vim.opt.showmatch = true

--http://vim.wikia.com/wiki/Searching
vim.opt.hlsearch   =true  
vim.opt.incsearch  =true 
vim.opt.ignorecase =true 
vim.opt.smartcase  =true

-- As opposed to `wrap`
-- set nowrap
vim.opt.wrap = true

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
vim.opt.clipboard = "unnamedplus,unnamed"
-- vim.opt.clipboard = "unnamed"
-- " for macOS
-- " set clipboard=unnamed
-- 
-- " Folding
-- " https://vim.fandom.com/wiki/Folding
-- " https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
-- " https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldmethod="indent"  -- indent, syntax, expr, marker, diff
vim.opt.foldnestmax=1
vim.opt.foldlevelstart=1



