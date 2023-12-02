return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        event = { "UIEnter" },
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("plugins.ui.lualine")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins.ui.neo-tree")
        end
    },
    {
        "utilyre/barbecue.nvim",
        lazy = true,
        event = { "BufEnter" },
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = {
            "famiu/bufdelete.nvim",
        },
        config = function()
            require("plugins.ui.bufferline")
        end
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.ui.alpha-nvim")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        event = { "VeryLazy" },
        cmd = { "Telescope" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                lazy = true,
                build = 'make'
            },
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-project.nvim",
        },
        config = function()
            require("plugins.ui.telescope")
        end
    },
    
}
