local status, lualine = pcall(require, 'lualine')
if not status then
  vim.notify('not found lualine')
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {
      left = '|',
      right = '|',
    },
    section_separators = {
      left = ' ',
      right = '',
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    disabled_filetypes = {
      statusline = { 'dashboard', 'alpha', 'ministarter', 'snacks_dashboard' },
      winbar = {},
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        function()
          local names = {}
          for _, server in pairs(vim.lsp.get_active_clients()) do
            table.insert(names, server.name)
          end
          if vim.tbl_isempty(names) then
            return ''
          else
            return ' [' .. table.concat(names, ' ') .. ']'
          end
        end,
      },
      'filename',
      -- "navic",
    },
    lualine_x = {
      'filesize',
      {
        'fileformat',
        -- symbols = {
        --   unix = '', -- e712
        --   dos = '', -- e70f
        --   mac = '', -- e711
        -- },
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      'encoding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'nvim-tree', 'quickfix' },
})
