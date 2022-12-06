local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
-- local xnoremap = bind("x")
-- local inoremap = bind("i")
local silent = { silent = true }

-- set leader key
vim.g.mapleader = " "

-- create splits with same file
nnoremap("sz", ":new<CR>")
nnoremap("sv", ":vnew<CR>")

-- increment/decrement numbers
nnoremap("<leader>+", "<C-a>")
nnoremap("<leader>-", "<C-x>")

-- tree
nnoremap("<leader>k", ":NvimTreeToggle<CR>")

-- telescope
nnoremap("<C-p>", ":Telescope find_files<CR>")
nnoremap("<leader>ps", ":Telescope live_grep<CR>")
nnoremap("<leader>ph", ":Telescope help_tags<CR>")
nnoremap("<leader>pd", ":Telescope diagnostics<CR>")
nnoremap("<leader>pb", ":Telescope buffers<CR>")

-- lsp
nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>", silent)
nnoremap("gr", ":lua vim.lsp.buf.references()<CR>", silent)
nnoremap("K", ":lua vim.lsp.buf.hover()<CR>", silent)
nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>", silent)
nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", silent)
nnoremap("<leader>dl", ":lua vim.diagnostic.open_float()<CR>", silent)
nnoremap("<leader>dn", ":lua vim.diagnostic.goto_next()<CR>", silent)

-- switch focus between split
nnoremap("<C-h>", ":wincmd h<CR>")
nnoremap("<C-j>", ":wincmd j<CR>")
nnoremap("<C-k>", ":wincmd k<CR>")
nnoremap("<C-l>", ":wincmd l<CR>")

-- move selected text up/down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- search and replace on cursor word
nnoremap("<leader><leader>", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>")

-- tabs
nnoremap("<Tab>", ":tabnext<CR>")
nnoremap("<S-Tab>", ":tabprevious<CR>")
nnoremap("<leader>t", ":tabnew<CR>")

-- persistent clipboard
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')
nnoremap("<leader>c", '"_c')
vnoremap("<leader>c", '"_c')

-- replace selection with clipboard contents
vnoremap("<leader>p", '"dP')

-- next search instance is placed at the middle
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- places cursor at the middle while page up/down
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- persist selection after adjusting indentation
vnoremap(">", ">gv")
vnoremap("<", "<gv")

-- source current luafile
nnoremap("<leader><CR>", ":luafile %<CR>")

-- resize splits using arrow keys
nnoremap("<Up>", ":resize +2<CR>")
nnoremap("<Down>", ":resize -2<CR>")
nnoremap("<Left>", ":vertical resize +2<CR>")
nnoremap("<Right>", ":vertical resize -2<CR>")

-- git integrations
nmap("<leader>gd", ":Gvdiffsplit<CR>", silent)
nmap("<leader>gs", ":G<CR>")
nnoremap("<leader>gc", ":Git commit<CR>")
