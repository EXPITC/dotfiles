local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
  window = {
    width = .9 -- width will be 85% of the editor width
  }
}

vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
