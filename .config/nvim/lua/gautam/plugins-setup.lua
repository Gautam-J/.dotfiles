-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- true if packer was just installed
local packer_bootstrap = ensure_packer()

-- reloads neovim and updates/installs/removes plugins on file save saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- install the plugin manager itself
	use("wbthomason/packer.nvim")
	-- custom functions that other plugins require
	use("nvim-lua/plenary.nvim")
	-- colorscheme
	use("sainnhe/gruvbox-material")
	-- managing comments
	use("numToStr/Comment.nvim")
	-- sidetree, with icons
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	-- tree for managing nvim's tree undo structure
	use("mbbill/undotree")
	-- bottom statusline
	use("nvim-lualine/lualine.nvim")
	-- extn for fuzzy finder
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
	})
	-- autocomplete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- managing lsp, formatting, and diagnostics
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- nvim lsp, with autocomplete and symbols
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind.nvim")
	-- formatting and diagnostics
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	-- nvim treesitter for better syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- autoclose brackets, quotes, tags
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	-- git integration
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	-- wakatime to track time spent coding
	use("wakatime/vim-wakatime")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
