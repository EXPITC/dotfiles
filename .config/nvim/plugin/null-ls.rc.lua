local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup {
  sources = {
    -- formating
    formatting.prettierd,
    -- formatting.eslint_d,

    -- diagnostic
    diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
      diagnostic_config = {
        -- see :help vim.diagnostic.config()
        severity_sort = true,
      }
    }),
    diagnostics.fish,
    diagnostics.stylelint.with({
      -- this for css or modern css strict
      extra_args = { "--config", vim.fn.expand("~/.config/nvim/utils/linter-config/.stylelintrc.json") }
    }),

    -- code actions
    code_actions.eslint_d
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
