local status, dashboard = pcall(require, 'dashboard')
if not status then
  vim.notify('not found dashboard')
  return
end

local header = {
  [[]],
  [[          ▀████▀▄▄              ▄█ ]],
  [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
  [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
  [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
  [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
  [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
  [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
  [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
  [[   █   █  █      ▄▄           ▄▀   ]],
  [[]],
  [[]],
}

-- {
--   icon = ' ',
--   icon_hl = 'Title',
--   desc = 'Find File           ',
--   desc_hl = 'String',
--   key = 'b',
--   keymap = 'SPC f f',
--   key_hl = 'Number',
--   key_format = ' %s', -- remove default surrounding `[]`
--   action = 'lua print(2)',
-- },
local center = {
  {
    icon = '  ',
    desc = 'Projects                            ',
    action = 'Telescope projects',
  },
  {
    icon = '  ',
    desc = 'Recently files                      ',
    action = 'Telescope oldfiles',
  },
  {
    icon = '  ',
    desc = 'Edit keybindings                    ',
    action = 'edit ~/.config/nvim/lua/keybindings.lua',
  },
  {
    icon = '  ',
    desc = 'Edit Projects                       ',
    action = 'edit ~/.local/share/nvim/project_nvim/project_history',
  },
  -- {
  --   icon = "  ",
  --   desc = "Edit .bashrc                        ",
  --   action = "edit ~/.bashrc",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Change colorscheme                  ",
  --   action = "ChangeColorScheme",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Edit init.lua                       ",
  --   action = "edit ~/.config/nvim/init.lua",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}

local opts = {
  theme = 'doom',
  config = {
    week_header = {
      enable = false, --boolean use a week header
      -- concat = 'a', --concat string after time string line
      -- append = 'b', --table append after time string line
    },
    packages = { enable = false }, -- show how many plugins neovim loaded
    header = header, --your header
    center = center,
    footer = {}, --your footer
  },
}

dashboard.setup(opts)
