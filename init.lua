
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
    --------------------------add your plugins here------------------------
    -----------------------------------------------------------------------
  {
      'catppuccin/nvim',
      name = "catpuccin",
      priority = 1000,
  },
  {
      'vim-airline/vim-airline', 
        config = function()
            -- Define custom symbols if Powerline fonts are not working
            vim.g.airline_powerline_fonts = 1
            vim.g.airline_left_sep = ''
            vim.g.airline_left_alt_sep = ''
            vim.g.airline_right_sep = ''
            vim.g.airline_right_alt_sep = ''
            vim.g.airline_branch = ''
            vim.g.airline_readonly = ''
            vim.g.airline_linenr = '␊'
            -- Disable the whitespace extension completely
            -- vim.g.airline_extensions_whitespace_enabled = 0
            -- Disable whitespace checking on a per-buffer basis
            vim.api.nvim_create_autocmd('BufEnter', {
              pattern = '*',
              callback = function()
                vim.b.airline_whitespace_disabled = 1
              end
            })
        end
  },
  {
      'vim-airline/vim-airline-themes',
        config = function()
            vim.g.airline_theme = "bubblegum"
            --vim.g.airline_theme = "catppuccin"
            --vim.g.airline_theme = "molokai"
            --vim.g.airline_theme = "wombat"
        end
  },
  {
      'dpelle/vim-LanguageTool',
  },
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "nordic" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

--------------------------------------------------------------------------
-- Vim options
--------------------------------------------------------------------------
--Coloscheme
--catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme "catppuccin-macchiato"

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
--------------------------------------------------------------------------
-- keymaps
--------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<S-l>", "<cmd>normal! 20l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "<cmd>normal! 20h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-k>", "<cmd>normal! 10k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-j>", "<cmd>normal! 10j<CR>", { noremap = true, silent = true })


-- Copy to system-clipboard +x, +d
vim.keymap.set('n', 'x', '"+x')
vim.keymap.set('v', 'x', '"+x')
vim.keymap.set('n', 'd', '"+d')
vim.keymap.set('v', 'd', '"+d')
-- Paste from system-clipboard +p
vim.keymap.set('n', 'p', '"+p')
vim.keymap.set('v', 'p', '"+p')
-- Move end to end
vim.keymap.set('n', '<C-h>', '<Home>')
vim.keymap.set('n', '<C-l>', '<End>')

-- Add parentheses
vim.keymap.set('v', '9', function()
    vim.api.nvim_input('d')
    vim.api.nvim_input('i(')
    vim.api.nvim_input('<esc>')
    vim.api.nvim_input('p')
    vim.api.nvim_input('a)')
    vim.api.nvim_input('<esc>')
end)

-- Add Quates
vim.keymap.set('v', '\'', function()
    vim.api.nvim_input('d')
    vim.api.nvim_input('i\"')
    vim.api.nvim_input('<esc>')
    vim.api.nvim_input('p')
    vim.api.nvim_input('a\"')
    vim.api.nvim_input('<esc>')
end)

-- Toggle comment("#") at the start of the line  
vim.keymap.set('n', '<C-_>', function()
    vim.api.nvim_input('m')                           -- save current position
    vim.api.nvim_input('z')                           -- at "z"
    vim.api.nvim_input('<Home>')
    local line = vim.api.nvim_get_current_line()      -- Get the current line and column position
    -- local col = vim.fn.col('.') - 1                -- Column position. Convert to 0-based index
    local char = line:sub(1, 1)                       -- Get the character under the cursor
    -- print("Character under cursor: " .. char)      -- Print the character
    if char == "#" then
        vim.api.nvim_input('i')
        vim.api.nvim_input('<del>')
        vim.api.nvim_input('<esc>')
        vim.api.nvim_input('`')                -- move to saved position
        vim.api.nvim_input('z')                -- 'z'
        vim.api.nvim_input('h')                -- move left 1 space
        vim.api.nvim_input(':delmarks z <CR>') -- remove saved position
    else
        vim.api.nvim_input('i')
        vim.api.nvim_input('#')
        vim.api.nvim_input('<esc>')
        vim.api.nvim_input('h')
        vim.api.nvim_input('viw')
        vim.api.nvim_input('x')
        vim.api.nvim_input('`')
        vim.api.nvim_input('z')
        vim.api.nvim_input('l')
        vim.api.nvim_input(':delmarks z <CR>')
    end
end)


