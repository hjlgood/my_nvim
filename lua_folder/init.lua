
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

