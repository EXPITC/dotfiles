-- package.path = package.path .. './nvim-ufo.rc.lua'

local status, ufo = pcall(require, "ufo")
local protocol = require('vim.lsp.protocol')
local capabilities = protocol.make_client_capabilities()

if (not status) then
  print("UFO NOT FOUND")
  return
end
local opt = vim.opt
local ftMap = {
  vim = 'indent',
  python = { 'indent' },
  git = ''
}
-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--   require('lspconfig')[ls].setup({
--     capabilities = capabilities
--     -- you can add other fields for setting up lsp server in this table
--   })
-- end
local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = { 'imports', 'comment', },
  preview = {
    win_config = {
      border = { '', '─', '', '', '', '─', '', '' },
      winhighlight = 'Normal:Folded',
      winblend = 0
    },
    mappings = {
      scrollU = '<C-f>',
      scrollD = '<C-d>'
    }
  },
  fold_virt_text_handler = handler,
  provider_selector = function(bufnr, filetype, buftype)
    -- if you prefer treesitter provider rather than lsp,
    return ftMap[filetype] or { 'treesitter', 'indent' }
    -- return ftMap[filetype]

    -- refer to ./doc/example.lua for detail
  end
})

opt.fillchars = {
  -- vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  --diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "",
  foldsep = "│",
  foldclose = "",
}
opt.foldcolumn = "2"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true
local key = vim.keymap.set

-- key("n", "zR", ufo.openAllFolds)
-- key("n", "zM", ufo.closeAllFolds)
key('n', 'zr', ufo.openFoldsExceptKinds)
key('n', 'zm', ufo.closeFoldsWith)


function bool(_)
  if _ == -1 then return true end
  return false
end

key('n', '<Cr>', function()
  -- print(vim.fn.indent("."))
  -- print(vim.fn.foldlevel("."))
  if bool(vim.fn.foldclosed(".")) then
    vim.cmd.foldclose()
  else
    vim.cmd.foldopen()
  end
end)

vim.keymap.set('n', '<C-n>', ufo.goPreviousStartFold)
-- vim.keymap.set('n', '<C-N>', ufo.goPreviousClosedFold)
