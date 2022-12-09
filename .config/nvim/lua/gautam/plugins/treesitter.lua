local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		-- indentation is not implemented properly for Python
		disable = { "python" },
	},
	autotag = {
		enable = true,
	},
	ensure_installed = "all",
	auto_install = true,
})
