local config = function()
	local conform = require("conform")

	local formatters = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		go = { "gci" },
		bash = { "beautysh" },
		sh = { "beautysh" },
	}

	local custom_formatters = vim.deepcopy(formatters)
	custom_formatters.yaml = { "prettier" }

	local format_settings = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
		formatters = custom_formatters,
	}

	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			conform.format(format_settings)
		end,
	})

	conform.setup({
		--which formatter is used for which language
		formatters_by_ft = formatters,
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	async = false,
		-- 	timeout_ms = 500,
		-- },
		formatters = {
			prettier = {
				args = function()
					-- if there is .prettierrc.json file in the project use it, else use the global path
					local args = { "--stdin-filepath", "$FILENAME" }

					local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG") or "no"

					local globalPrettierConfig = vim.fn.glob("../../defaults/.prettierrc.json", true, true)
					local localPrettierConfig = vim.fn.glob(".prettierrc", true, true)

					if not disableGlobalPrettierConfig and #globalPrettierConfig > 0 then
						vim.list_extend(args, { "--config", globalPrettierConfig[1] })
					elseif #localPrettierConfig > 0 then
						vim.list_extend(args, { "--config", localPrettierConfig[1] })
					end

					-- tailwind plugin for reference
					local tailwindPluginPathList =
						vim.fn.glob("node_modules/prettier-plugin-tailwindcss", "", true, true)
					local hasTailwindPrettierPlugin = false

					if #tailwindPluginPathList > 0 then
						local tailwindPluginPath = tailwindPluginPathList[1]
						hasTailwindPrettierPlugin = vim.fn.isdirectory(tailwindPluginPath) == 1
					end

					if hasTailwindPrettierPlugin then
						vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
					end

					-- debugging info
					print("disableGlobalPrettierConfig:", vim.inspect(disableGlobalPrettierConfig))
					print("globalPrettierConfig:", vim.inspect(globalPrettierConfig))
					print("localPrettierConfig:", vim.inspect(localPrettierConfig))
					return args
				end,
			},
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>gf", function()
		conform.format(format_settings)
	end, { desc = "Format file or range" })

	vim.keymap.set({ "n", "v" }, "<leader>gcf", function()
		local bufnr = vim.fn.bufnr()
		local formatter_info = conform.list_formatters(bufnr)

		for _, formatter in ipairs(formatter_info) do
			print(formatter.name)
		end
	end, { desc = "List all formatters for this buffer." })
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
}
