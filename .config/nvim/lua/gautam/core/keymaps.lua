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
local xnoremap = bind("x")
local inoremap = bind("i")

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

-- lsp
local lsp_opts = { silent = true }
nnoremap("gf", ":Lspsaga lsp_finder<CR>", lsp_opts)
nnoremap("gd", ":Lspsaga peek_definition<CR>", lsp_opts)
nnoremap("<leader>ca", ":Lspsaga code_action<CR>", lsp_opts)
nnoremap("<leader>rn", ":Lspsaga rename<CR>", lsp_opts)
nnoremap("K", ":Lspsaga hover_doc<CR>", lsp_opts)
nnoremap("<leader>o", ":LSoutlineToggle<CR>", lsp_opts)
nnoremap("<leader>dl", ":Lspsaga show_line_diagnostics<CR>", lsp_opts)
nnoremap("<leader>dc", ":Lspsaga show_cursor_diagnostics<CR>", lsp_opts)
nnoremap("<leader>dn", ":Lspsaga diagnostic_jump_next<CR>", lsp_opts)
