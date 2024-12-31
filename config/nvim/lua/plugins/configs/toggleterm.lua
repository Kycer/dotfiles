local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  vim.notify('not found toggleterm')
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  shade_terminals = true,
  direction = 'float',
  close_on_exit = true,
  float_opts = {
    border = 'single',
  },
})
