local function config()
    require('lualine').setup({
        options = {
            theme = 'catppuccin',
            component_separators = {},
            section_separators = {},
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str)
                        return str:sub(1, 1)
                    end,
                },
            },
            lualine_y = { 'progress', 'selectioncount', 'searchcount' },
        },
        extension = { 'fugitive', 'nerdtree', 'quickfix' },
    })
end
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = config,
}
