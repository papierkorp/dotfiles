local config = function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		ensure_installed = {
			"lua",
			"python",
			"dockerfile",
			"yaml",
			"jsonc",
			"html",
			"javascript",
			"typescript",
			"bash",
			"c",
			"css",
			"scss",
			"comment",
			"gdscript",
			"java",
			"jq",
			"kotlin",
			"php",
			"regex",
			"ruby",
			"sql",
			"ssh_config",
			"toml",
			"vim",
			"xml",
			"go",
			"gomod",
			"gosum",
			"gowork",
			"markdown",
			"markdown_inline",
		},
		auto_install = true,
		ignore_install = { "" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = false },
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config,
}
