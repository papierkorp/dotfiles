local config = function()
    local cat = require("catppuccin")

    vim.cmd('colorscheme catppuccin')
    cat.setup({
        flavour = "mocha",
        transparent_background = true,
    })
end

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = config
}
