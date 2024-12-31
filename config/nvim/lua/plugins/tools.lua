return {
  -- symbol line 大纲
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  -- trouble
  {
    'folke/trouble.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  -- true false 反转
  {
    'rmagatti/alternate-toggler',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.alternate')
    end,
  },
  -- 书签
  {
    'tomasky/bookmarks.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.bookmarks')
    end,
  },
  -- 多光标插件
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvimtools/hydra.nvim',
    },
    opts = {
      hint_config = false,
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  },
  -- flash
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      label = {
        uppercase = false,
      },
    },
  },
}
