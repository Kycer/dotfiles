local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
  vim.notify('not found nvim-tree')
  return
end

nvim_tree.setup({

  disable_netrw = true,
  sync_root_with_cwd = true,
  filters = {
    dotfiles = true,
    custom = { 'node_modules' },
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭
      quit_on_open = true,
    },
  },
  renderer = {
    root_folder_label = false,
    indent_markers = {
      enable = false,
      icons = {
        corner = '└',
        edge = '│',
        item = '│',
        none = ' ',
      },
    },
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '󰄱',
          staged = '',
          unmerged = '',
          renamed = '➜',
          untracked = '',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
  -- keymap override
  on_attach = function(buffer_id)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return {
        desc = 'nvim-tree: ' .. desc,
        buffer = buffer_id,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end
    -- use add default mappings
    api.config.mappings.default_on_attach(buffer_id)

    -- vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open: Vertical Split'))
    -- vim.keymap.set('n', 'sh', api.node.open.horizontal, opts('Open: Horizontal Split'))
  end,
  git = {
    timeout = 5000,
  },
})
