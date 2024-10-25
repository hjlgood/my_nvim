~/.config/nvim/

git init
git remote add origin git@github.com:hjlgood/my_nvim.git

or
git remote set-url origin git@github.com:hjlgood/my_nvim.git

git remote -v



Open a terminal.
Clone the Packer repository:
text
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

Create the Neovim configuration directory if it doesn't exist:
text
mkdir -p ~/.config/nvim

Create a new init.lua file:
text
nvim ~/.config/nvim/init.lua

Add the following Lua code to init.lua:
lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Add other plugins here

end)

Save and exit the file (press Esc, then type :wq and press Enter).
Open Neovim:
text
nvim

Run the PackerSync command to install Packer:
text
:PackerSync

Wait for Packer to finish installing.
Restart Neovim.
Now Packer is installed and ready to use. You can add more plugins by editing the init.lua file and adding them within the require('packer').startup(function(use) ... end) block. After adding new plugins, run :PackerSync again to install them.
Remember to check the Packer documentation for more advanced usage and configuration options.
