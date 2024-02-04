local config = function()
	local wilder = require("wilder")

	wilder.setup({
		modes = {
			":",
			"/",
			"?",
		},
	})
end

return {
	"gelguy/wilder.nvim",
	config = config,
}
