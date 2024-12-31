local status, mason = pcall(require, 'mason')
if not status then
  vim.notify('not found mason')
  return
end
local status, neodev = pcall(require, 'neodev')
if not status then
  vim.notify('not found neodev')
  return
end
local status, lspsaga = pcall(require, 'lspsaga')
if not status then
  vim.notify('not found lspsaga')
  return
end

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

neodev.setup()
lspsaga.setup()

mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

local alones = {}
local servers = {}
local installServers = {}

local list = require('plugins.configs.lsp.list')

for _, ele in pairs(list) do
  if ele.enable == nil or ele.enable then
    table.insert(installServers, ele.name)
    if ele.alone then
      table.insert(alones, ele.name)
    else
      table.insert(servers, ele.name)
    end
  end
end

local servers_handlers = {}

print(vim.inspect(servers))
local default_config = require('plugins.configs.lsp.default')
for _, value in pairs(servers) do
  local module = 'lang.' .. value
  local status, config = pcall(require, module)
  if not status then
    config = {}
  end
  servers_handlers[value] = function()
    local setup = vim.tbl_deep_extend('force', default_config(), config)
    lspconfig[value].setup(setup)
    -- print(vim.inspect(setup))
  end
end

mason_lspconfig.setup({
  ensure_installed = installServers,
  automatic_installation = true,
  handlers = servers_handlers,
})
