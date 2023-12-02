local notify = require("notify")
notify.setup({
    stages = "fade_in_slide_out",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 3000,
    minimum_width = 50,
    background_colour = "#000000",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})

vim.notify = notify
require("noice").setup({
    messages = {
        enabled = true,                          -- enables the Noice messages UI
        view = "notify",                         -- default view for messages
        view_error = "notify",                   -- view for errors
        view_warn = "notify",                    -- view for warnings
        view_history = "messages",               -- view for :messages
        view_search = "virtualtext",             -- view for search count messages. Set to `false` to disable
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
        },
        hover = {
            enabled = false,
        },
        signature = {
            enabled = false,
        },
    },
})

require("telescope").load_extension("noice")
