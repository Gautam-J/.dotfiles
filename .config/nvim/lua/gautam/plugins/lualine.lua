local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- by default, lualine's theme is auto
lualine.setup({
	options = {
		theme = "gruvbox-material",
		globalstatus = true,
	},
	sections = {
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				symbols = { error = "E", warn = "W", info = "I", hint = "H" },
			},
		},
	},
})
