vim.cmd('autocmd!')
local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'fish'
opt.backupskip = '/tmp/*,/private/tmp/*'
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true -- Auto indent
opt.si = true -- Smart indent
opt.wrap = true -- No wrap lines
opt.backspace = 'start,eol,indent'
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
opt.listchars = { eol = '↲', tab = '▸ ', trail = '·', space = "·" }
opt.list = true

-- Color Schemes Tokyonight
-- vim.cmd([[let g:lightline = {'colorscheme': 'tokyonight'}]])

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd [[let g:indent_blankline_char = "┃"]]

-- Default cursor
-- block = block cursor
-- ver25 = thin horizontal cursor
-- hor20 = underline cursor
-- opt["guicursor"] = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
opt["guicursor"] = "n-v-c-sm:block,i-ci-ve:hor20,r-cr-o:hor20"

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }
