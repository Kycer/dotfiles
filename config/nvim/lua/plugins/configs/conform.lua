local status, conform = pcall(require, 'conform')
if not status then
  vim.notify('not found conform')
  return
end
conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    css = { 'prettierd' },
    json = { 'prettierd' },
    html = { 'prettierd' },
    yaml = { 'prettierd' },
    toml = { 'taplo' },
    markdown = { 'prettierd' },
    rust = { 'rustfmt' },
    sh = { 'shfmt' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
