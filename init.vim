if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
    source ~/.config/nvim/lua_folder/init.lua
endif

source ~/.config/nvim/lua_folder/keymaps.lua
source ~/.config/nvim/lua_folder/options.lua
