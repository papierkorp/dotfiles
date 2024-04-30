local config = function()
	local oil = require("oil")
	oil.setup({
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	})
end
return {
	"stevearc/oil.nvim",
	config = config,
}
