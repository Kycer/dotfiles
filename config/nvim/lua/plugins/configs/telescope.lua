local status, telescope = pcall(require, 'telescope')
if not status then
  vim.notify('not found telescope')
  return
end

telescope.setup({
  defaults = {
    -- The initial mode entered after opening the pop-up window, the default is insert, it can also be normal
    initial_mode = 'insert',
    -- Shortcut keys in the window
    mappings = {
      i = {
        -- Moving up and down
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        -- history record
        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',
        -- close the window
        ['<C-c>'] = 'close',
        -- The preview window scrolls up and down
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
      },
    },
    file_ignore_patterns = { 'node_modules', 'dist', '__pycache__' },
  },
  pickers = {
    -- Built-in pickers configuration
    find_files = {
      -- Find files for skinning, supported parameters are: dropdown, cursor, ivy
      -- theme = "dropdown",
      hidden = false,
    },
  },
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = 'vertical',
      layout_config = {
        preview_height = 0.8,
      },
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ['_'] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
  },
})

-- Telescope extensions
telescope.load_extension('fzf')
telescope.load_extension('undo')
telescope.load_extension('live_grep_args')
local status_new, _ = pcall(require, 'aerial')
if status_new then
  telescope.load_extension('aerial')
end
