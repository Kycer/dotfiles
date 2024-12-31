return {
  {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
      'creativenull/efmls-configs-nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      'b0o/schemastore.nvim',
      'nvimdev/lspsaga.nvim',
    },
    config = function()
      require('plugins.configs.lsp')
    end,
  },
  -- lsp progress
  {
    'j-hui/fidget.nvim',
    branch = 'legacy',
    event = 'VeryLazy',
  },
}
