-- place configs before setting colorscheme
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_better_performance = 1

local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
    print("Colorscheme not found!")
    return
end
