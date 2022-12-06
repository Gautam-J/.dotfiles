local opt = vim.opt

vim.g.netwr_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.autoindent = true
opt.smartindent = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.completeopt = "menu,menuone,noselect"

opt.hlsearch = false
opt.showmode = false

opt.timeoutlen = 500
opt.ttimeoutlen = 20

opt.scrolloff = 8
opt.colorcolumn = "80"

opt.matchpairs:append("<:>")
opt.whichwrap:append("<,>")
opt.showmatch = true

opt.mouse = "nv"
opt.writebackup = false
opt.swapfile = false

opt.inccommand = "split"
opt.lazyredraw = true
opt.laststatus = 3
