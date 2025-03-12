return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
            -- +--------------------------------------------------------------------------+
            -- |                             Language Servers                             |
            -- +--------------------------------------------------------------------------+
            -- ----------------------------------------------------------------------------
                ensure_installed = {
                    "clangd",
                    "gopls",
                    "lua_ls",
                    "ts_ls",
                    "zls"
                }
            -- ----------------------------------------------------------------------------
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp_config = require("lspconfig")

        -- +--------------------------------------+
        -- |           Setting up LSPs            |
        -- +--------------------------------------+
        -- ----------------------------------------
            lsp_config.clangd.setup({})
            lsp_config.gopls.setup({})
            lsp_config.lua_ls.setup({})
            lsp_config.ts_ls.setup({})
            lsp_config.zls.setup({})
        -- ----------------------------------------

        -- +---------------------------------------------------------------------------+
        -- |                               LSP Keybindings                             |
        -- +---------------------------------------------------------------------------+
        -- -----------------------------------------------------------------------------
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'v', 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
        -- ------------------------------------------------------------------------------
        end
    }
}
