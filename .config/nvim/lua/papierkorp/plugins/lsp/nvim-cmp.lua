local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		completion = {
			completeopt = "menu,menuone,preview,noinsert,noselect",
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<TAB>"] = cmp.mapping.confirm(),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "fonts" },
			{ name = "nvim-html-css" },
			{ name = "scss variables" },
			{ name = "sass-variables" },
			{ name = "color_names" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmp-cmdline-history" },
		}, {
			{ name = "cmdline" },
		}),
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"amarakon/nvim-cmp-fonts",
		"Jezda1337/nvim-html-css",
		"mmolhoek/cmp-scss",
		"nat-418/cmp-color-names.nvim",
		"pontusk/cmp-sass-variables",
		{ "windwp/nvim-autopairs", events = "InsertEnter", opts = {} },
	},
	config = config,
}
