local config = function()
	local harpoon = require("harpoon")

	require("telescope").load_extension("harpoon")

	harpoon.setup({})
end

return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}
