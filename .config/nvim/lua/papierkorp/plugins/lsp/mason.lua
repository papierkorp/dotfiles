local config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_formatterandlinter_installer = require("mason-tool-installer")

    mason.setup({
        ui = {
            icons = {},
        },
    })

    mason_lspconfig.setup({
        ensure_installed = {
            "tsserver",
            "html",
            "cssls",
            "lua_ls",
            "pyright",
            "gopls",
            "bashls",
            "groovyls",
            -- "kotlin_language_server",
            "helm_ls",
            "dockerls",
            "docker_compose_language_service",
        },
        automatic_installation = true,
    })

    mason_formatterandlinter_installer.setup({
        ensure_installed = {
            "prettier",
            "eslint_d",
            "stylua",
            "luacheck",
            "flake8", -- python linter
            "black",  -- python formatter
            -- "yamllint",
            "ansible-lint",
            "revive",     -- golang linter
            "gci",        -- golang formatter
            "shellcheck", -- bash linter
            "beautysh",   -- bash formatter
            "ktlint",     -- kotlin linter+formatter
            "trivy",      -- helm linter
        },
    })
end

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = config,
}
