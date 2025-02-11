--------------------------------------------------------------------------
-- keymaps or shortcuts
--------------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>normal! 20l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>normal! 20h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>normal! 5k<CR>",  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>normal! 5j<CR>",  { noremap = true, silent = true })


-- Copy to system-clipboard +x, +d
vim.keymap.set('n', 'x', '"+x')
vim.keymap.set('v', 'x', '"+x')
vim.keymap.set('n', 'd', '"+d')
vim.keymap.set('v', 'd', '"+d')
-- Paste from system-clipboard +p
vim.keymap.set('n', 'p', '"+p')
vim.keymap.set('v', 'p', '"+p')


-- Add parentheses
vim.keymap.set('v', '9', function()
    vim.api.nvim_input('di()<esc>hp')
end)

-- Add Double Quates
vim.keymap.set('v', '\'', function()
    vim.api.nvim_input('di\"\"<esc>hp')
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


