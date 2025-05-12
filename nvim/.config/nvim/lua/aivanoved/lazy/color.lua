local function catppucin_config()
    vim.opt.termguicolors = true
    local catppuccin = require('catppuccin')

    --- @type CatppuccinOptions
    local opts = vim.empty_dict()

    opts.flavour = 'mocha'
    opts.transparent_background = true

    opts.styles = {
        comments = { 'italic' },
    }

    catppuccin.setup(opts)

    vim.cmd.colorscheme('catppuccin')
end

return {
    'ryanoasis/vim-devicons',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = catppucin_config,
    },
    'tribela/vim-transparent',
}
