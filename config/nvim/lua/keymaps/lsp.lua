local util = require('util.keymap')
local M = {}
M.lsp_keys = function(buf)
  return {
    {
      from = '<A-r>',
      to = '<cmd>Lspsaga rename ++project<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Rename' },
    },
    {
      from = 'K',
      to = '<cmd>Lspsaga hover_doc<CR>',
      -- to = function()
      --   vim.lsp.buf.hover()
      -- end,
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Hover Documentation' },
    },
    {
      from = '<A-Enter>',
      to = '<cmd>Lspsaga code_action<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Hover Documentation' },
    },
    {
      from = 'gd',
      to = '<cmd>Telescope lsp_definitions<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Goto Definition' },
    },
    {
      from = 'gi',
      to = '<cmd>Telescope lsp_implementations<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Goto Implementation' },
    },
    {
      from = 'gr',
      to = '<cmd>Telescope lsp_references<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Goto Implementation' },
    },
    {
      from = '<leader>da',
      to = '<cmd>Telescope diagnostics<cr>',
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Open Diagnostics' },
    },
    {
      from = '<leader>cf',
      to = function()
        require('conform').format({ bufnr = buf, async = false, lsp_fallback = true })
      end,
      mode = util.mode_n,
      opts = { buffer = buf, desc = 'LSP: Format Code' },
    },
  }
end

return M
