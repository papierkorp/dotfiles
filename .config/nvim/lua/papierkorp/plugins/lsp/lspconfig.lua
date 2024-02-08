local config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local util = require("lspconfig/util")

    local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap
        opts.buffer = bufnr

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    --lua server
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })

    -- html server
    lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- typescript server
    lspconfig["tsserver"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- css server
    lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- python server
    lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- kotlin server
    -- lspconfig["kotlin_language_server"].setup({
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --     root_dir = lspconfig.util.root_pattern(".git", "gradle.properties"),
    --     init_options = {
    --         storagePath = util.path.join(vim.env.XDG_DATA_HOME, "nvim-data"),
    --     }
    -- })

    -- golang server
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    -- groovy server
    lspconfig.groovyls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "groovy", "jenkins", "jenkinsfile", "groovy.jenkins" },
    })

    -- bash server
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- ansible server
    lspconfig["ansiblels"].setup({
        filetypes = {
            "yaml.ansible",
        },
        settings = {
            ansible = {
                ansible = {
                    path = "ansible",
                    useFullyQualifiedCollectionNames = true,
                },
            },
            executionEnvironment = {
                enabled = false,
            },
            validation = {
                enabled = true,
                lint = { enabled = true },
            },
        },
        capabilities = capabilities,
        on_attach = on_attach,
    })

    --docker server
    lspconfig["dockerls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    lspconfig["docker_compose_language_service"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    event = { "BufReadPre", "BufNewFile" }, --only open this plugin whenever we open a new buffer
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
}
