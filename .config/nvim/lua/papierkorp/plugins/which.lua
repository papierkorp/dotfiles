local opts = {
	prefix = "<leader>",
	mappings = {
		f = {
			name = "Telescope",
		},
		["g"] = {
			name = "+LSP",
		},
		["<leader>c"] = {
			name = "+Code Actions",
		},
	},
}

local config = function()
	local wk = require("which-key")

	wk.setup({
		mappings = {
			f = {
				name = "Telescope",
			},
			["g"] = {
				name = "+LSP",
			},
			["<leader>c"] = {
				name = "+Code Actions",
			},
		},
		window = {
			position = "top",
		},
	})
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- lazy = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = opts,
	-- config = config,
}
