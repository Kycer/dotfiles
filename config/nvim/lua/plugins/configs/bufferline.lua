local status, bufferline = pcall(require, 'bufferline')
if not status then
  vim.notify('not found bufferline')
  return
end

-- bufferline config
-- https://github.com/akinsho/bufferline.nvim#configuration
---@diagnostic disable-next-line: missing-fields
bufferline.setup({
  ---@diagnostic disable-next-line: missing-fields
  options = {
    numbers = 'buffer_id',
    move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
    -- To close the Tab command, use moll/vim-bbye's :Bdelete command here
    close_command = 'Bdelete! %d',
    right_mouse_command = 'Bdelete! %d',
    -- Using nvim's built-in LSP will be configured later in the course
    diagnostics = 'nvim_lsp',
    -- Optional, show LSP error icon
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and '' or (e == 'warning' and '' or '')
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'Outline',
        text = 'Outline',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'aerial',
        text = 'Outline',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'dbui',
        text = 'Database Manager',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'httpResult',
        text = 'Http Result',
        text_align = 'center',
        saperator = true,
      },
      {
        filetype = 'OverseerList',
        text = 'Tasks',
        text_align = 'center',
        saperator = true,
      },
    },
  },
})
