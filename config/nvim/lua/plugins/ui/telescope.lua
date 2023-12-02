require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    mappings = {
        i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-t>"] = "which_key",
        },
        n = {
            -- ["<C-t>"] = trouble.open_with_trouble,
            ["q"] = require("telescope.actions").close,
        },
    },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')
require('telescope').load_extension('project')
local telescope= require('telescope')
local builtin= require('telescope.builtin')
local themes= require('telescope.themes')
require('core.keymaps').telescope(telescope, builtin, themes)
