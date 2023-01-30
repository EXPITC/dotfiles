local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      -- disable netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- costum insert mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function() vim.cmd('startinsert') end,
        }
      }
    }
  }
}

telescope.load_extension('file_browser')
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)

keymap('n', ';f',
  function()
    builtin.find_files({
      file_ignore_patterns = { ".git/*" },
      no_ignore = false,
      hidden = true
    })
  end
  , opts)
keymap('n', ';r', function()
  builtin.live_grep()
end)
keymap('n', '\\\\', function()
  builtin.buffers()
end)
keymap('n', ';t', function()
  builtin.help_tags()
end)
keymap('n', ';;', function()
  builtin.resume()
end)
keymap('n', ';e', function()
  builtin.diagnostics()
end)
keymap('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    all_previwer = true,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 27 }
  })
end)
