local keymap = vim.keymap
local opts = { noremap = true, silent = true, desc = "" }

-- Home Keys
opts.desc = "Home"
keymap.set("n", "<leader>h", ":echo 'Home'<CR>", opts)
opts.desc = "Lazy Home"
keymap.set("n", "<leader>hl", ":Lazy home<CR>", opts)
opts.desc = "Mason Home"
keymap.set("n", "<leader>hm", ":Mason<CR>", opts)

-- Pane Navigation
opts.desc = "Pane Navigation"
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

opts.desc = "Splits"
keymap.set("n", "<leader>s", ":echo 'Splits'<CR>", opts)
opts.desc = "Split right"
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
opts.desc = "Split bottom"
keymap.set("n", "<leader>sh", ":split<CR>", opts)

opts.desc = "Fast quit"
keymap.set("n", "<C-q>", ":q<CR>", opts)

-- Navigation
opts.desc = "Navigation"
-- keymap.set("n", "<J>", "10jzz", opts)
-- keymap.set("n", "<K>", "10kzz", opts)

-- Buffer
opts.desc = "Buffers"
keymap.set("n", "<leader>b", ":echo 'Buffers'<CR>", opts)
opts.desc = "current Buffers"
keymap.set("n", "<leader>bn", ":bnext<CR>", opts)
opts.desc = "previous Buffer"
keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)
opts.desc = "Show Buffers List"
keymap.set("n", "<leader>bl", ":Telescope buffers<CR>", opts)

-- Comments
vim.api.nvim_set_keymap("n", "q", "gcc", { silent = true, desc = "Comments" })
vim.api.nvim_set_keymap("v", "q", "gcc", { silent = true, desc = "Comments" })

-- Indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
opts.desc = "Insert empty line"
keymap.set("n", "<Leader>o", "o<Esc>", opts)

-- dont copy on delete
opts.desc = "Dont copy on delete"
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "d", '"_d', opts)
keymap.set("v", "d", '"_d', opts)

-- delete ^M (new Lines from dos to unix)
opts.desc = "Delete ^M new lines after copy"
vim.api.nvim_set_keymap("n", "<leader>dm", ":%s/\\r//g<CR>", opts)

-- specials
opts.desc = "Disable search results"
keymap.set("n", "<esc><esc>", ":silent! nohls<CR>", opts) -- disable search results in lualine

---------- Plugins
-- Telescope
opts.desc = "Telescope"
keymap.set("n", "<leader>f", ":echo 'Telescope'<CR>", opts)
opts.desc = "Show Keymaps"
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
opts.desc = "Open Help"
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
opts.desc = "Fuzzy find files in cwd"
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
opts.desc = "Find string in cwd"
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
opts.desc = "Show Buffers"
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
opts.desc = "Find string under cursor in cwd"
keymap.set("n", "<leader>fm", ":Telescope grep_string<CR>", opts)
opts.desc = "Fuzzy find recent files"
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
opts.desc = "Open up Filebrowser"
keymap.set("n", "<leader>fi", ":Telescope file_browser<CR>", opts)
opts.desc = "Fuzzy find files in cwd without preview"
keymap.set(
	"n",
	"<leader>fff",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
	opts
)
opts.desc = "Open up the File Browser from current File"
keymap.set("n", "<leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)

-- Trouble
opts.desc = "Trouble"
keymap.set("n", "<leader>x", ":echo 'Trouble'<CR>", opts)
opts.desc = "Toggle Trouble"
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
opts.desc = "Trouble Workspace Diagnostics"
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
opts.desc = "Trouble Document Diagnostics"
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
opts.desc = "Trouble quickfix"
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
opts.desc = "Trouble loclist"
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
opts.desc = "Trouble LSP references"
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- which key
opts.desc = "Which Key"
keymap.set("n", "<leader>w", ":echo 'Which Key'<CR>", opts)
keymap.set("n", "<leader>wk", "<cmd>WhichKey<cr>", opts)

-- LSP

opts.desc = "LSP"
keymap.set("n", "<leader>g", ":echo 'LSP'<CR>", opts)

opts.desc = "LSP extras"
keymap.set("n", "<leader>r", ":echo 'LSP extras'<CR>", opts)

opts.desc = "Show LSP references"
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)

opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

-- undotree

opts.desc = "Toggle Undotree"
keymap.set("n", "<leader>ru", ":UndotreeToggle<CR>", opts)
