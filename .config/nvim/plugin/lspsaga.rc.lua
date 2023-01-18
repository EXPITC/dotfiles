-- require('lazy').setup({
--   'glepnir/lspsaga.nvim',
--   event = 'BufRead',
--   config = function()
--     require('lspsaga').setup({})
--   end
-- })


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '=', '<Cmd>Lspsaga diagnostic_jump_next<Cr>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<Cr>', opts)
vim.keymap.set('n', 'K', function()
  -- local winid = require('ufo').peekFoldedLinesUnderCursor()
  -- if not winid then
  vim.cmd('Lspsaga hover_doc')
  -- end
end)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<Cr>', opts)
vim.keymap.set('i', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<Cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<Cr>', opts)
vim.keymap.set('n', '<C-G>', '<Cmd>Lspsaga term_toggle<Cr>', opts)
