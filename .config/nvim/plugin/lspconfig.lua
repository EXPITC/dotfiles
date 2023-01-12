local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  -- Formattin
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end


local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  -- Formatting

  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

-- enable css cmp
local cmp_capabilities = vim.lsp.protocol.make_client_capabilities()
cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(cmp_capabilities)
nvim_lsp.cssls.setup {
  capabilities = cmp_capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
    on_attach(client, bufnr)
  end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  --capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}
