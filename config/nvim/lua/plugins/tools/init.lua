return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("plugins.tools.noice")
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = { 'InsertEnter', 'VeryLazy' },
        config = function()
            local autopairs = require("nvim-autopairs")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            autopairs.setup({})
            local cmp = require("cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)" },
            { "k", "<Plug>(accelerated_jk_gk)" },
        },
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        config = function()
            require("persistence").setup()
            vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
            vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
            vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        event = { "VeryLazy" },
        config = function()
            require("flash").setup()
            require("core.keymaps").Flash()
        end,
    },
    {
        'echasnovski/mini.ai',
        config = true,
    },
    {
        "echasnovski/mini.comment",
        config = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.tools.gitsings")
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    -- 多光标插件
    {
        "mg979/vim-visual-multi",
        lazy = true,
        keys = {
            { "<C-n>", mode = { "n", "x" }, desc = "visual multi" },
        },
    },
    -- 颜色显示
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPost", "InsertEnter", "VeryLazy" },
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    RGB = true,          -- #RGB hex codes
                    RRGGBB = true,       -- #RRGGBB hex codes
                    names = false,       -- "Name" codes like Blue or blue
                    RRGGBBAA = false,    -- #RRGGBBAA hex codes
                    AARRGGBB = false,    -- 0xAARRGGBB hex codes
                    rgb_fn = false,      -- CSS rgb() and rgba() functions
                    hsl_fn = false,      -- CSS hsl() and hsla() functions
                    css = false,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes for `mode`: foreground, background,  virtualtext
                    mode = "background", -- Set the display mode.
                    -- Available methods are false / true / "normal" / "lsp" / "both"
                    -- True is same as normal
                    tailwind = false,                               -- Enable tailwind colors
                    -- parsers can contain values used in |user_default_options|
                    sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
                    virtualtext = "■",
                    -- update color values even if buffer is not focused
                    -- example use: cmp_menu, cmp_docs
                    always_update = false,
                },
                -- all the sub-options of filetypes apply to buftypes
                buftypes = {},
            })
        end,
    },

    -- 浮动窗口插件
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        version = "*",
        cmd = { "ToggleTerm" },
        config = function()
            require("toggleterm").setup({
                shade_terminals = true,
                direction = "horizontal",
                close_on_exit = true,
                float_opts = {
                    border = "single",
                },
            })
            require("core.keymaps").ToggleTerm()
        end,
    },
}
