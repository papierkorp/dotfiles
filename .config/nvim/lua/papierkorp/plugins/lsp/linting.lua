local config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        lua = { "luacheck" },
        python = { "flake8" },
        -- ansible = { "ansible_lint" },
        go = { "revive" },
        sh = { "shellcheck" },
        kotlin = { "ktlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        --pattern = { "*.ts", "*.js" },
        group = lint_augroup,
        callback = function()
            lint.try_lint()
        end,
    })

    -- Specify ESLint configuration file for eslint_d
    --
    lint.linters.eslint_d = {
        args = function()
            -- if there is .eslintrc.json file in the project use it, else use the global path
            local args = { "--stdin-filepath", "$FILENAME" }

            local globalEslintConfig = vim.fn.glob("../../defaults/.eslintrc.json", true, true)
            local localEslintConfig = vim.fn.glob(".eslintrc", true, true)

            if #globalEslintConfig > 0 then
                vim.list_extend(args, { "--config", globalEslintConfig[1] })
            elseif #localEslintConfig > 0 then
                vim.list_extend(args, { "--config", localEslintConfig[1] })
            end

            -- debugging info
            print("globalEslintConfig:", vim.inspect(globalEslintConfig))
            print("localEslintConfig:", vim.inspect(localEslintConfig))
            return args
        end,
    }

    -- keymaps
    vim.keymap.set("n", "<leader>gl", function()
        lint.try_lint()
    end, { desc = "Trigger linting for current file" })

    local lint_progress = function()
        local linters = require("lint").get_running()
        if #linters == 0 then
            return "no linter active"
        end
        return "󱉶 " .. table.concat(linters, ", ")
    end
    vim.keymap.set("n", "<leader>gcl", function()
        vim.print(lint_progress())
    end, { desc = "Show current Linter" })
end

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = config,
}
