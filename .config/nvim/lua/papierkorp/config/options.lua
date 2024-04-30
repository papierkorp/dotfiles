local opt = vim.opt
local cmd = vim.cmd

-- else vim.clipboard will take a large amount of startup time
vim.g.clipboard = {
    name = "xclip",
    copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection primary",
    },
    paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = 1,
}

-- Tab / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
-- opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"

opt.guicursor = "n-v-c:block-Cursor,o:hor50,i-ci-ve:ver25,sm:block-blinkon0"
-- a:all,n:normal,v:visual,c:command,i:insert,ve:virtualedit,sm:select-mode,o:operator-pending
-- lCursor=shape of block-cursor,hor50=horizontal-cursor-50%-width,ver25=virutal-cursor-25%-width,blinkon0=disable-blinking
opt.encoding = "UTF-8"
opt.clipboard:append("unnamedplus")

-- Recognize special Filetypes
cmd([[autocmd BufNewFile,BufRead */jenkins/*,*/*jenkins* set filetype=groovy.jenkins]])
cmd([[autocmd BufNewFile,BufRead */*dockerfile* set filetype=Dockerfile]])
cmd([[autocmd BufNewFile,BufRead */*Dockerfile* set filetype=Dockerfile]])
cmd([[autocmd BufNewFile,BufRead */*docker*compose* set filetype=yaml.docker-compose]])

-- darker color for visual mode
vim.api.nvim_exec([[
  augroup MyVisualHighlight
    autocmd!
    autocmd ColorScheme * highlight Visual guibg=#31f1e2 guifg=#000000
  augroup END
]], false)
