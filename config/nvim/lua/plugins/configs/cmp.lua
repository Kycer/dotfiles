-- gray
vim.api.nvim_set_hl(
  0,
  'CmpItemAbbrDeprecated',
  { bg = 'NONE', strikethrough = true, fg = '#808080' }
)
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

local status_cmp, cmp = pcall(require, 'cmp')
if not status_cmp then
  vim.notify('not found cmp')
  return
end

-- lspkind
local status_lspkind, lspkind = pcall(require, 'lspkind')
if not status_lspkind then
  vim.notify('not found lspkind')
  return
end

local status_luasnip, luasnip = pcall(require, 'luasnip')
if not status_luasnip then
  vim.notify('not found luasnip')
  return
end

-- autopairs
local status_npairs, npairs = pcall(require, 'nvim-autopairs')
if not status_npairs then
  vim.notify('not found nvim-autopairs')
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
    java = false, -- don't check treesitter on java
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  preselect = cmp.PreselectMode.None,
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },
    documentation = cmp.config.window.bordered(),
  },
  -- Specify the snippet engine
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  -- Completion source
  sources = cmp.config.sources({
    { name = 'codeium' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'lazydev' },
    { name = 'buffer' },
  }),
  experimental = {
    ghost_text = true,
  },
  -- Shortcut settings
  mapping = {
    -- prev
    ['<C-p>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
      end
    end,
    -- Next
    ['<C-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    -- confirm
    ['<CR>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- super tab
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        end
      else
        fallback()
      end
    end, { 'i', 's', 'c' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's', 'c' }),
    -- Scrolling if the window has too much content
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- Custom code snippet to jump to next parameter
    ['<C-l>'] = cmp.mapping(function(_)
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      if vim.snippet.active({ direction = 1 }) then
        feedkey('<cmd>lua vim.snippet.jump(1)<CR>', '')
      end
    end, { 'i', 's' }),

    -- Custom code snippet to jump to the previous parameter
    ['<C-h>'] = cmp.mapping(function()
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      if vim.snippet.active({ direction = -1 }) then
        feedkey('<cmd>lua vim.snippet.jump(-1)<CR>', '')
      end
    end, { 'i', 's' }),
  },
  -- Display type icons with lspkind-nvim
  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      --mode = 'symbol', -- show only symbol annotations

      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        --- @cast vim_item vim.CompletedItem
        -- Source Displays the source of the hint
        if entry.source.name == 'rg' or entry.source.name == 'buffer' then
          vim_item.dup = nil
        end
        vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
        return vim_item
      end,
      symbol_map = { Copilot = '' },
    }),
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' },
  }, {
    { name = 'buffer' },
  }),
})

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
