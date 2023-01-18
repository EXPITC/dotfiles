local status, i = pcall(require, 'indent_blankline')
if not status then return end

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#1f2335 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#EB9C5C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#5C64EB gui=nocombine]]
vim.cmd [[highlight Signature guifg=#aba7e7 gui=nocombine]]
vim.cmd [[highlight Signature2 guifg=#9d7cd8 gui=nocombine]]
vim.cmd [[highlight SignatureSpace guifg=#737aa2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine ]]
vim.cmd [[let g:indent_blankline_char = "┃"]]
-- vim.cmd [[let g:indent_blankline_char_blankline = '┆']]
-- vim.cmd("let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']")
-- vim.cmd [[let g:indent_blankline_space_char_blankline = ' ']]
vim.cmd("let g:indent_blankline_char_list_blankline = ['┃ ', ' ',]")

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

i.setup {
  char = "┃",
  char_highlight_list = {
    "Signature",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "SignatureSpace",
  },
  blankline_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2"
  },
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = false,
}
