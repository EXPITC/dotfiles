local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local util = nvim_lsp.util
local protocol = require('vim.lsp.protocol')
local capabilities = protocol.make_client_capabilities()

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

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --
end

-- enable css cmp
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
nvim_lsp.cssls.setup {
  capabilities = cmp_capabilities
}

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
    on_attach(client, bufnr)
  end,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = function(fname)
    return util.root_pattern 'tsconfig.json' (fname)
        or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  end,
  -- capabilities = capabilities
}

-- vue
nvim_lsp.vuels.setup{}

local function get_typescript_server_path(root_dir)

  local global_ts = '/opt/homebrew/lib/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end
nvim_lsp.volar.setup{
  filetypes = { 'vue' },
  -- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
  cmd = { "vue-language-server", "--stdio" },
  init_options = {
    typescript = {
      tsdk = '/opt/homebrew/lib/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- npm root -g
    }
  },
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  root_dir = util.root_pattern 'package.json',
}

-- nvim_lsp.volar.setup {
--   -- on_attach = function(client, bufnr)
--   --   enable_format_on_save(client, bufnr)
--   --   on_attach(client, bufnr)
--   -- end,
--   cmd = { "vue-language-server", "--stdio" }, 
--   filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
--   init_options = {
--     typescript = {
--       tsdk = '/Users/expitc/.npm/lib/node_modules/typescript/lib'
--     }
--   },
--   root_dir = function(fname)
--     return util.root_pattern 'vue.config.js' (fname)
--         or util.root_pattern('package.json', 'vue.config.js')(fname)
--   end,
-- }
--
nvim_lsp.graphql.setup {
  -- filetypes = { "graphql", "typescriptreact", "javascriptreact" },
  -- autostart = true,
  -- root_dir = util.root_pattern('.git', '.graphqlrc*', '.graphql.config.*', 'graphql.config.*'),
  -- cmd = { "graphql-lsp", "server -m", "stream" }
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
