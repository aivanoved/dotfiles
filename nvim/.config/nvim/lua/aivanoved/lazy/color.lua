local function catppucin_config()
    local catppuccin = require('catppuccin')
    catppuccin.setup({
        flavor = 'mocha',
        transparency = true,
    })
    vim.cmd.colorscheme('catppuccin')
end

return {
    'ryanoasis/vim-devicons',
    { 'catppuccin/nvim', name = 'catppuccin', config = catppucin_config },
    'tribela/vim-transparent',
}
