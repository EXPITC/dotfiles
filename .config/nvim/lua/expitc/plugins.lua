local status, packer = pcall(require, 'packer')
if not (status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use 'folke/tokyonight.nvim' -- Theme
  use 'tjdevries/colorbuddy.nvim'
  use 'folke/lsp-colors.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'norcalli/nvim-colorizer.lua'

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use({
    'glepnir/lspsaga.nvim',
    opt = true,
    branch = "main",
    event = { 'BufRead', 'BufReadPost' },
    config = function()
      require('lspsaga').setup({
        scroll_preview = {
          scroll_down = '<C-d>',
          scroll_up = '<C-f>',
        },
      })
    end
  }) -- LSP UIs
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use { 'numtostr/comment.nvim',
    requires = {
      'joosepalviste/nvim-ts-context-commentstring'
    }
  }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- Folding
  use { 'lukas-reineke/indent-blankline.nvim' } -- Indent
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'akinsho/nvim-bufferline.lua'
  use 'folke/zen-mode.nvim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browser

end)
