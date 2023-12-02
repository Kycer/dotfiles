require("core.keymaps").Bufferline()
require("bufferline").setup({
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   local s = " "
        --   for e, n in pairs(diagnostics_dict) do
        --     local sym = e == "error" and " " or (e == "warning" and " " or " ")
        --     s = s .. n .. sym
        --   end
        --   return s
        -- end,
        -- 左侧让出 neo-tree 的位置
        offsets = {
            { filetype = "NvimTree",     text = "File Explorer",    text_align = "center", saperator = true },
            { filetype = "Outline",      text = "Outline",          text_align = "center", saperator = true },
            { filetype = "neo-tree",     text = "File Explorer",    text_align = "center", saperator = true },
            { filetype = "aerial",       text = "Outline",          text_align = "center", saperator = true },
            { filetype = "packer",       text = "Plugin Manager",   text_align = "center", saperator = true },
            { filetype = "dbui",         text = "Database Manager", text_align = "center", saperator = true },
            { filetype = "SidebarNvim",  text = "Sidebar",          text_align = "center", saperator = true },
            { filetype = "httpResult",   text = "Http Result",      text_align = "center", saperator = true },
            { filetype = "OverseerList", text = "Tasks",            text_align = "center", saperator = true },
        },
        -- offsets = {
        --   {
        --     filetype = "DiffviewFiles",
        --     text = function()
        --       return "DiffviewFilePanel"
        --     end,
        --     padding = 1,
        --     highlight = "Directory",
        --     -- text_align = "center"
        --     text_align = "left",
        --   },
        --   {
        --     filetype = "flutterToolsOutline",
        --     text = " Outline",
        --     padding = 1,
        --     highlight = "Directory",
        --     text_align = "left",
        --   },
        --   {
        --   {
        --     filetype = "JavaProjects",
        --     text = " JavaProjects",
        --     padding = 1,
        --     highlight = "Directory",
        --     text_align = "left",
        --   },
        -- },
        color_icons = true,
        show_buffer_close_icons = false,
        -- show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin" -- "slant" | "thick" | "thin" | { 'any', 'any' },
        -- separator_style = "slant",
    },
})
