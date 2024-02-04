local config = function()
	local lualine = require("lualine")

	lualine.setup({
		options = {
			icons_enabled = false,
			component_separators = { right = "|" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "diagnostics", "buffers" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "searchcount", "selectioncount" },
			lualine_z = { "progress", "location" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	config = config,
}
