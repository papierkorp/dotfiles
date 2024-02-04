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
		sh = { "beautysh" },
	}

	conform.setup({
		--which formatter is used for which language
		formatters_by_ft = formatters,
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
		formatters = {
			prettier = {
				args = function()
					-- if there is .prettierrc.json file in the project use it, else use the global path
					local args = { "--stdin-filepath", "$FILENAME" }

					local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG")
					local globalPrettierConfig =
						vim.fn.glob("C:\\develop\\space\\leasone\\webapp\\.prettierrc.json", true, true)
					local localPrettierConfig = vim.fn.glob(".prettierrc", true, true)

					if not disableGlobalPrettierConfig and globalPrettierConfig ~= "" then
						vim.list_extend(args, { "--config", globalPrettierConfig })
					elseif localPrettierConfig ~= "" then
						vim.list_extend(args, { "--config", localPrettierConfig })
					end

					local hasTailwindPrettierPlugin = vim.fn.isdirectory(
						vim.fn.glob("node_modules/prettier-plugin-tailwindcss", "", true, true)
					) == 1
					if hasTailwindPrettierPlugin then
						vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
					end

					return args
				end,
			},
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>gf", function()
		local custom_formatters = vim.deepcopy(formatters)
		custom_formatters.yaml = { "prettier" }

		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
			formatters = custom_formatters,
		})
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
