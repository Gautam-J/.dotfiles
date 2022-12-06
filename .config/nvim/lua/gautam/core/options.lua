local opt = vim.opt

vim.g.undotree_WindowLayout = 2
vim.g.python3_host_prog = "/Users/gautam/miniforge3/bin/python"

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

-- set indentation based on file language
vim.cmd([[
  augroup lang_indentation
    autocmd!
    autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype lua setlocal tabstop=2 shiftwidth=2 softtabstop=2
  augroup end
]])
