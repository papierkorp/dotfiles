local config = function()
	local noice = require("noice")
	noice.setup({
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		cmdline = {
			view = "cmdline_popup",
		},
		views = {
			popupmenu = {
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticsInfo" },
				},
			},
		},
	})
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
