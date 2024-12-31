return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    lazy = true,
    event = { 'VeryLazy' },
    cmd = { 'Telescope' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'debugloop/telescope-undo.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('plugins.configs.telescope')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      --- ui denpendences
      'onsails/lspkind-nvim',
      --- autopairs
      'windwp/nvim-autopairs',
      'rafamadriz/friendly-snippets',
      -- snippet
      'saadparwaiz1/cmp_luasnip',
    },
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.cmp')
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function()
      require('plugins.configs.treesitter')
    end,
  },
  -- todo
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.conform')
    end,
  },
  -- codeium
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup({})
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.comment')
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
