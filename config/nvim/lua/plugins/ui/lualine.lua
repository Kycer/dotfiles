local config = {
    options = {
        -- 指定皮肤
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = "tokyonight",
        -- 分割线
        component_separators = {
            left = "|",
            right = "|",
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            left = " ",
            right = "",
        },
        globalstatus = true,
    },
    extensions = { "neo-tree" },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            {
                function()
                    local names = {}
                    for _, server in pairs(vim.lsp.get_active_clients()) do
                        table.insert(names, server.name)
                    end
                    if vim.tbl_isempty(names) then
                        return " [No LSP]"
                    else
                        return " [" .. table.concat(names, " ") .. "]"
                    end
                end,
            },
            "filename",
            -- "navic",
        },
        -- lualine_c = {
        --   "filename",
        --   {
        -----  arkav/lualine-lsp-progress
        --     "lsp_progress",
        --     spinner_symbols = { " ", " ", " ", " ", " ", " " },
        --   },
        -- },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                -- symbols = {
                --   unix = '', -- e712
                --   dos = '', -- e70f
                --   mac = '', -- e711
                -- },
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            "encoding",
            "filetype",
        },
    },
}

require("lualine").setup(config)
