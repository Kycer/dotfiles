local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local keymapb = function(mode, keys, func, buffer, desc)
    vim.keymap.set(mode, keys, func, { noremap = true, silent = true, buffer = buffer, desc = desc })
end

local M = {}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

M.setup = function()
    -- Esc
    keymap("i", "jj", "<C-\\><C-N>", opts)
    -- n/v 模式下复制内容到系统剪切板
    keymap({ "n", "v" }, "<Leader>y", '"+yy', opts)
    -- n 模式下粘贴系统剪切板的内容
    keymap("n", "<Leader>p", '"+p', opts)
    -- 取消搜索高亮显示
    keymap("n", "<Leader><CR>", ":nohlsearch<CR>", opts)

    -- Better window navigation
    keymap("n", "<C-h>", "<C-w>h", opts)
    keymap("n", "<C-j>", "<C-w>j", opts)
    keymap("n", "<C-k>", "<C-w>k", opts)
    keymap("n", "<C-l>", "<C-w>l", opts)
    keymap("n", "<A-w>", "<C-w>c", opts)
    keymap("n", "<A-o>", "<C-w>o", opts)
    keymap("n", "<A-s>", "<cmd>sp<CR>", opts)
    keymap("n", "<A-v>", "<cmd>vsp<CR>", opts)

    -- 禁用方向键盘
    keymap({ "n", "i", "v" }, "<Left>", "<Nop>")
    keymap({ "n", "i", "v" }, "<Right>", "<Nop>")
    keymap({ "n", "i", "v" }, "<Up>", "<Nop>")
    keymap({ "n", "i", "v" }, "<Down>", "<Nop>")

    -- Navigate line
    keymap({ "n", "v" }, "H", "^", opts)
    keymap({ "n", "v" }, "L", "$", opts)

    -- save buffer
    keymap("n", "<leader>w", "<cmd>w<cr>", opts)
    keymap("n", "<leader>wa", "<cmd>wa<cr>", opts)
    keymap("n", "<leader>wq", "<cmd>wqa<cr>", opts)
    -- delete cur buffer
    -- keymap("n", "<leader>qd", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
    -- keymap("n", "<leader>qq", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
    -- keymap("n", "<leader>bc", "<cmd>bd<CR>")

    -- exit cur window
    keymap("n", "<leader>Q", "<cmd>q<cr>", opts)

    -- Resize with arrows
    keymap("n", "<A-Up>", ":resize -2<CR>", opts)
    keymap("n", "<A-Down>", ":resize +2<CR>", opts)
    keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
    keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

    -- Move text up and down
    -- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
    -- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
    keymap({ "v" }, "J", ":m '>+1<CR>gv=gv")
    keymap({ "v" }, "K", ":m '<-2<CR>gv=gv")
    -- Stay in indent mode
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)
end

-- Neo-Tree
M.Neotree = function()
    keymap("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts)
end

-- bufferline
M.Bufferline = function()
    -- 左右Tab切换
    keymap("n", '[b', "<cmd>BufferLineCyclePrev<CR>")
    keymap("n", ']b', "<cmd>BufferLineCycleNext<CR>")
    keymap("n", 'gb', "<cmd>BufferLinePick<CR>")
    -- "moll/vim-bbye" 关闭当前 buffer
    keymap("n", '<leader>bw', "<cmd>Bdelete!<CR>", opts)
    -- 关闭选中标签页
    keymap("n", '<leader>bp', "<cmd>BufferLinePickClose<CR>")
    -- 关闭左/右侧标签页
    keymap("n", '<leader>bch', "<cmd>BufferLineCloseLeft<CR>")
    keymap("n", '<leader>bcl', "<cmd>BufferLineCloseRight<CR>")
    -- 关闭其他标签页
    keymap("n", '<leader>bo', "<cmd>BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
end

-- telescope
M.telescope = function(telescope, builtin, themes)
    keymap('n', '<leader><space>', builtin.buffers, opts)
    keymap('n', '<leader>ff', builtin.find_files, opts)
    keymap('n', '<leader>fb', builtin.builtin, opts)
    keymap('n', '<leader>fp', function()
        telescope.extensions.project.project { display_type = 'full' }
    end, opts)
    keymap('n', '<leader>fm', builtin.marks, opts)
    keymap('n', '<leader>fg', builtin.live_grep, opts)
    keymap('n', '<leader>fh', builtin.help_tags, opts)
    keymap('n', '<leader>qf', builtin.quickfix, opts)
    keymap('n', '<leader>km', builtin.keymaps, opts)
    keymap('n', '<leader>?', builtin.oldfiles, opts)
    keymap('n', '<c-p>', builtin.commands, opts)
    keymap('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, opts)
end

M.Flash = function()
    keymap({ "n", "x", "o" }, "s",
        function()
            require("flash").jump({
                search = {
                    mode = function(str)
                        return "\\<" .. str
                    end,
                },
            })
        end
    )
    keymap({ "n", "x", "o" }, "S",
        function()
            require("flash").treesitter()
        end
    )
    keymap({ "o" }, "r",
        function()
            require("flash").remote()
        end
    )
    keymap({ "o", "x" }, "R",
        function()
            require("flash").treesitter_search()
        end
    )
    keymap({ "c" }, "<c-s>",
        function()
            require("flash").toggle()
        end
    )
end

M.Lsp = function(buffer)
    -- 重命名
    keymapb("n", '<leader>rn', "<cmd>Lspsaga rename ++project<cr>", buffer, 'LSP: Rename')
    -- 查看文档
    keymapb("n", 'K', "<cmd>Lspsaga hover_doc<CR>", buffer, 'Hover Documentation')
    -- Code Action
    keymapb({ "n", "v" }, '<leader>ca', "<cmd>Lspsaga code_action<CR>", buffer, 'LSP: Code Action')
    keymapb("n", 'gd', "<cmd>Telescope  lsp_definitions<CR>", buffer, 'LSP: Goto Definition')
    keymapb("n", 'gi', "<cmd>Telescope lsp_implementations<CR>", buffer, 'LSP: Goto Implementation')
    keymapb("n", 'gr', "<cmd>Telescope lsp_references<CR>", buffer, 'LSP: Goto References')
    -- keymapb("n", '<leader>wa', vim.lsp.buf.add_workspace_folder, buffer, '[W]orkspace [A]dd Folder')
    -- keymapb("n", '<leader>wr', vim.lsp.buf.remove_workspace_folder, buffer, '[W]orkspace [R]emove Folder')
    -- keymapb("n", '<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, buffer, '[W]orkspace [L]ist Folders')
    keymapb("n", '<leader>D', vim.lsp.buf.type_definition, buffer, 'Type [D]efinition')
    keymapb("n", '<leader>da', "<cmd>Telescope diagnostics<CR>", buffer, 'LSP: DiAgnostics')
    keymapb("n", "<leader>l", function()
        vim.lsp.buf.format { async = true }
    end, buffer, "LSP: Format code")
end

-- ToggleTerm
M.ToggleTerm = function()
    keymap({"n", "v"}, "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
end

return M
