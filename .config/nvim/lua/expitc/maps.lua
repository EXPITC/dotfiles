local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_X')

-- Incremeant/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission {not working for now}
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %',{})

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
-- Split windowmaps
keymap.set('n', 'ss', ':set nowrap<Return>:split<Return><C-w>W')
keymap.set('n', 'sv', ':set nowrap<Return>:vsplit<Return><C-w>W')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Rezise window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
