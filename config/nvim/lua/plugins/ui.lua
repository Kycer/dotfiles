return {
  {
    'nvim-tree/nvim-tree.lua',
    event = 'UIEnter',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.configs.nvim-tree')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'UIEnter' },
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional dependency
      'f-person/git-blame.nvim',
    },
    config = function()
      require('plugins.configs.lualine')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = { 'UIEnter' },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'famiu/bufdelete.nvim',
    },
    config = function()
      require('plugins.configs.bufferline')
    end,
  },
  -- 通知
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('plugins.configs.noice')
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    config = function()
      require('plugins.configs.ibl')
    end,
  },
  -- 浮动窗口插件
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    event = 'VeryLazy',
    version = '*',
    cmd = { 'ToggleTerm' },
    config = function()
      require('plugins.configs.toggleterm')
    end,
  },
  -- ufo fold
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim',
    },
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.ufo')
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    enable = false,
    config = function()
      require('plugins.configs.dashboard')
    end,
  },
  {
    'goolord/alpha-nvim',
    init = false,
    event = 'VimEnter',
    config = function()
      require('plugins.configs.alpha')
    end,
  },
}
