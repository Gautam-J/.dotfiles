local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- by default, lualine's theme is auto
lualine.setup({
    options = {
        theme = "gruvbox-material",
    },
})
