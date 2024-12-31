local M = {}
M.mode_i = { 'i' }
M.mode_n = { 'n' }
M.mode_v = { 'v' }
M.mode_t = { 't' }
M.mode_x = { 'x' }
M.mode_o = { 'o' }
M.mode_nv = { 'n', 'v' }
M.mode_nx = { 'n', 'x' }
M.mode_nxo = { 'n', 'x', 'o' }
M.mode_niv = { 'n', 'i', 'v' }

local opts = { noremap = true, silent = true }

function M.key_exists(tbl, key)
  return rawget(tbl, key) ~= nil
end

function M.maps(mappings)
  for _, mapping in ipairs(mappings) do
    if M.key_exists(mapping, 'desc') then
      opts['desc'] = mapping.desc
    end
    if M.key_exists(mapping, 'opts') then
      opts = vim.tbl_deep_extend('force', {}, opts, mapping.opts)
    end
    vim.keymap.set(mapping.mode or 'n', mapping.from, mapping.to, opts)
  end
end

function M.buf_maps(mappings, buf)
  for _, mapping in ipairs(mappings) do
    if M.key_exists(mapping, 'desc') then
      opts['desc'] = mapping.desc
    end
    if M.key_exists(mapping, 'opts') then
      opts = vim.tbl_deep_extend('force', {}, opts, mapping.opts)
    end
    vim.api.nvim_buf_set_keymap(buf, mapping.mode or 'n', mapping.from, mapping.to, opts)
  end
end

return M
