local M = {}

function M.end_with(str, ending)
  return ending == '' or str:sub(-#ending) == ending
end

function M.load_plugins()
  local dir = vim.fn.stdpath('config') .. '/lua/plugins'
  for fname, filetype in vim.fs.dir(dir, { depth = 2 }) do
    if filetype == 'file' then
      if M.end_with(fname, '.lua') then
        local name = string.gsub(fname, '/', '.')
        local module_name = name:sub(1, #name - #'.lua')
        if not M.end_with(module_name, 'init') then
          local file = 'plugins.' .. module_name
          local status_ok, _ = pcall(require, file)
          if not status_ok then
            vim.notify('Failed loading ' .. module_name, vim.log.levels.ERROR)
          end
        end
      end
    end
  end
end

return M
