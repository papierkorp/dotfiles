# still cooking..

learned from https://www.youtube.com/watch?v=ZjMzBd1Dqz8 and https://www.youtube.com/watch?v=NL8D8EkphUw

# Possible Workflow (or how to actually start) - work in progress


# Helpful Nuggets

**Navigation in file**

- horizontal
    - relative jumps (5j, 5+, 5-)
    - Scrolling (CTRL-U/B, CTRL-D/F, gg, G)
- vertical
    - word-motion (wW, bB, e ge)
    - jumping (ft, 0$, %)

**Editing**

- Multiline Edit
    - `<CTRL> + V => hjkl => x (for deletion) / I (for Insert) + <ESC>`
- Indent One Line
    - `==`
- Indent / Tab Multilines
    - v + <
    - v + >

# KeyMaps

**Help**

Leader lh = Lazy Home => Plugin Manager (`keymaps.lua`)
Leader fk = show all Keybindings (`telescope.lua`)
Leader fh = help (`telescope.lua`)
Leader wk = Which Key (`keymaps.lua`)

**Navigation in file-tree**

- = open oil (vinegar like filesystem like a normal neovim buffer)
    - = move one folder down
    _ = go to home Directory
    gs = sort files and folders
    g. = show hidden files
    CTRL+s/h = splitview current file + filebrowser
    CTRL+p = preview selcted file
    CTRL+c = close filebrowser
Leader fi = open File Browser (`telescope.lua`)
    CTRL+e = home directory (`telescope.lua`)
    CTRL+w = pwd (`telescope.lua`)
    CTRL+c = new file/folder (`telescope.lua`)
Leader fc = open current file in File Browser (`telescope.lua`)
Leader fb = show buffers (`telescope.lua`)
Leader fr = show recent files (`telescope.lua`)

**Panes**

Leader sv = Split Panel to the right (`keymaps.lua`)
Leader sh = Split Panel to the bottom (`keymaps.lua`)


**Search**

Leader ff = find files with preview (`telescope.lua`)
Leader fff = find files without preview (`telescope.lua`)
Leader fs = find string in current work directory (`telescope.lua`)
Leader fss = find string under marker in current work directory (`telescope.lua`)

**Code Editor**

CTRL + q = comment out line (`keymaps.lua`)

Leader mp = format file (should happen with save) (`formatter.lua`)
Leader l = lint file (should happen automatically) (`linting.lua`)


**LSP**
gr = LSP References (`lspconfig.lua`)
gR = Trouble References (`trouble.lua`)
gD = LSP declaration (`lspconfig.lua`)
gd = LSP definitions (`lspconfig.lua`)
gi = LSP Implementations (`lspconfig.lua`)
gt = LSP Type definitions (`lspconfig.lua`)
Leader ca = LSP Code Actions (`lspconfig.lua`)
Leader rn = LSP Rename (`lspconfig.lua`)
Leader D = LSP diagnostics for file (`lspconfig.lua`)
Leader d = LSP diagnostics for line (`lspconfig.lua`)
K = LSP Documentation for cursor selection (`lspconfig.lua`)
Leader rs = restart LSP Server (`lspconfig.lua`)
CTRL + t = Open Trouble in Telescope (`trouble.lua`)
Leader xx = Activate Trouble (`trouble.lua`)
Leader xw = Activate Trouble for workspace (`trouble.lua`)
Leader xd = Activate Trouble for current document (`trouble.lua`)
Leader xq = Trouble quickfix (`trouble.lua`)
Leader xl = Trouble loclist (`trouble.lua`)




# Installed Plugins

```bash
ls ./plugins
ls ./plugins/lsp
```

**Essential**
- Telescope (file management, searching)

**Code**
- comment (to comment lines out..)
- illuminate (highlight current variable and all others)

**Editor**
- indent-blankline (shows a line in the editor tab groupings)
- highlightedyank (if i copy with y it shows with a short highlight blink, what is copied)

**Help**
- startuptime (:StartupTime for debugging)
- which (:WhichKey for a little help)
- wilder (auto-completion for the : cmdline)

**Theme**
- catppuccin/nvim
- transparent

**LSP**
- mason (to install lsp server)
- lspconfig (configure and map the installed servers to nvim)
- formatter (stevearc/conform.nvim, auto format on save)
- linter (mfussenegger/nvim-lint, well linting..)
- trouble (display diagnostics, references, definitions per telescope)
- autocomplete (hrsh7th/nvim-cmp, autocomplete..)

# want to add

inline markdown viewer (write own plugin?)
git
statusline
