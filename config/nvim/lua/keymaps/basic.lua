local util = require('util.keymap')

local keys = {
  -- base
  { from = 'jj', to = '<Esc>', mode = util.mode_i },
  { from = '<C-a>', to = 'ggVG', mode = util.mode_n },
  { from = '<C-s>', to = '<cmd>w<cr>', mode = util.mode_n },
  { from = '<C-s>', to = '<Esc><cmd>w<cr>', mode = util.mode_i },
  { from = '<leader>p', to = '"0p', mode = util.mode_nx }, -- 不粘贴删除内容
  { from = '<leader>qq', to = '<cmd>q<cr>', mode = util.mode_n },
  { from = '<leader>xx', to = '<cmd>x<cr>', mode = util.mode_n },
  { from = '<leader><cr>', to = '<cmd>nohlsearch<cr>', mode = util.mode_n }, -- 取消高亮显示
  { from = '<Left>', to = '<Nop>', mode = util.mode_niv },
  { from = '<Right>', to = '<Nop>', mode = util.mode_niv },
  { from = '<Up>', to = '<Nop>', mode = util.mode_niv },
  { from = '<Down>', to = '<Nop>', mode = util.mode_niv },

  -- nav
  { from = '<C-h>', to = '<C-w>h', mode = util.mode_n },
  { from = '<C-j>', to = '<C-w>j', mode = util.mode_n },
  { from = '<C-k>', to = '<C-w>k', mode = util.mode_n },
  { from = '<C-l>', to = '<C-w>l', mode = util.mode_n },
  { from = '<A-w>', to = '<C-w>c', mode = util.mode_n },
  { from = '<A-o>', to = '<C-w>o', mode = util.mode_n },
  { from = '<A-s>', to = '<cmd>sp<cr>', mode = util.mode_n },
  { from = '<A-v>', to = '<cmd>vsp<cr>', mode = util.mode_n },
  { from = 'H', to = '^', mode = util.mode_nv },
  { from = 'L', to = '$', mode = util.mode_nv },

  -- resize
  { from = '<A-Up>', to = '<cmd>resize -2<cr>', mode = util.mode_n },
  { from = '<A-Down>', to = '<cmd>resize +2<cr>', mode = util.mode_n },
  { from = '<A-Left>', to = '<cmd>vertical resize -2<cr>', mode = util.mode_n },
  { from = '<A-Right>', to = '<cmd>vertical resize +2<cr>', mode = util.mode_n },

  -- move
  { from = 'J', to = '<cmd>m ">+1<cr>gv=gv"', mode = util.mode_v },
  { from = 'K', to = '<cmd>m "<-2<cr>gv=gv"', mode = util.mode_v },
  { from = '<', to = '<gv"', mode = util.mode_v },
  { from = '>', to = '>gv"', mode = util.mode_v },

  -- plugins
  -- nvim
  { from = '<leader>e', to = '<cmd>NvimTreeToggle<cr>', mode = util.mode_n },
  -- bufferline
  { from = 'bd', to = '<cmd>Bdelete!<cr>', mode = util.mode_n },
  { from = 'bn', to = '<cmd>BufferLineCycleNext<cr>', mode = util.mode_n },
  { from = 'bp', to = '<cmd>BufferLineCyclePrev<cr>', mode = util.mode_n },
  { from = '<leader>bl', to = '<cmd>BufferLineCloseRight<cr>', mode = util.mode_n },
  { from = '<leader>bh', to = '<cmd>BufferLineCloseLeft<cr>', mode = util.mode_n },
  { from = '<leader>bn', to = '<cmd>BufferLineMoveNext<cr>', mode = util.mode_n },
  { from = '<leader>bp', to = '<cmd>BufferLineMovePrev<cr>', mode = util.mode_n },
  -- telescope
  { from = '<leader><space>', to = '<cmd>Telescope buffers<cr>', mode = util.mode_n },
  { from = '<leader>ff', to = '<cmd>Telescope find_files<cr>', mode = util.mode_n },
  { from = '<leader>fb', to = '<cmd>Telescope builtin<cr>', mode = util.mode_n },
  { from = '<leader>fm', to = '<cmd>Telescope marks<cr>', mode = util.mode_n },
  { from = '<leader>fl', to = '<cmd>Telescope live_grep<cr>', mode = util.mode_n },
  { from = '<leader>fh', to = '<cmd>Telescope help_tags<cr>', mode = util.mode_n },
  { from = '<leader>fc', to = '<cmd>Telescope commands<cr>', mode = util.mode_n },
  { from = '<leader>fo', to = '<cmd>Telescope oldfiles<cr>', mode = util.mode_n },
  {
    from = '<leader>/',
    to = function()
      require('telescope.builtin').current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        })
      )
    end,
    mode = util.mode_n,
  },
  -- 大纲
  { from = '<A-k>', to = '<cmd>Telescope aerial<cr>', mode = util.mode_n },
  -- lazy
  { from = '<leader>ml', to = '<cmd>Lazy<cr>', mode = util.mode_n },
  { from = '<leader>mm', to = '<cmd>Mason<cr>', mode = util.mode_n },
  -- alternate
  { from = '<leader>at', to = '<cmd>ToggleAlternate<cr>', mode = util.mode_n },
  -- bookmarks
  {
    from = '<A-b>',
    to = function()
      require('bookmarks').bookmark_toggle()
    end,
    mode = util.mode_n,
    desc = 'Toggle bookmark',
  },
  {
    from = '<leader>mi',
    to = function()
      require('bookmarks').bookmark_ann()
    end,
    mode = util.mode_n,
    desc = 'Edit bookmark annotation',
  },
  {
    from = '<leader>cb',
    to = function()
      require('bookmarks').bookmark_clean()
    end,
    mode = util.mode_n,
    desc = 'Clean Buffer Bookmark',
  },
  {
    from = '<leader>mxb',
    to = function()
      require('bookmarks').bookmark_clear_all()
    end,
    mode = util.mode_n,
    desc = 'Clean All Bookmark',
  },
  {
    from = '<A-S-b>',
    to = '<cmd>Telescope bookmarks list<cr>',
    mode = util.mode_n,
  },

  -- ufo
  {
    from = 'zR',
    to = function()
      require('ufo').openAllFolds()
    end,
    mode = util.mode_n,
    desc = 'Open All Fold',
  },
  {
    from = 'zM',
    to = function()
      require('ufo').closeAllFolds()
    end,
    mode = util.mode_n,
    desc = 'Close All Fold',
  },
  -- 多光标
  { from = '<A-j>', to = '<cmd>MCstart<cr>', mode = util.mode_n, desc = 'Multi Cursor Start' },
  {
    from = '<leader>cm',
    to = '<cmd>MCclear<cr>',
    mode = util.mode_n,
    desc = 'Multi Cursor Clear',
  },
  -- Flash
  {
    from = '<leader>ss',
    to = function()
      require('flash').jump()
    end,
    mode = util.mode_nxo,
    desc = 'Flash',
  },
  {
    from = '<leader>st',
    to = function()
      require('flash').treesitter()
    end,
    mode = util.mode_nxo,
    desc = 'Flash Treesitter',
  },
  {
    from = 'r',
    to = function()
      require('flash').remote()
    end,
    mode = util.mode_o,
    desc = 'Flash Remote',
  },
  {
    from = 'R',
    to = function()
      require('flash').treesitter_search()
    end,
    mode = util.mode_o,
    desc = 'Flash Treesitter Remote',
  },
}

util.maps(keys)
