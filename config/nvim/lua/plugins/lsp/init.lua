return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        "nvimdev/lspsaga.nvim",

    },
    config = function()
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            pyright = {},
            jsonls = {},
            marksman = {},
            -- volar = {},
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            -- ocamllsp = {},
            taplo = {},
            rust_analyzer = {},
            gopls = {},
            jdtls = {},
            sqlls = {},
            -- ruff_lsp = {},
        }
        local on_attach = function(_, buffer)
            require("core.keymaps").Lsp(buffer)
        end
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        settings = servers[server_name],
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end,
            }
        })
    end
}
