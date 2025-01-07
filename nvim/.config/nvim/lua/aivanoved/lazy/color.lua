local function config()
    vim.cmd.background = 'dark'

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.cmd.colorscheme('catppuccin-mocha')
end

return {
    'ryanoasis/vim-devicons',
    { 'catppuccin/nvim', name = 'catppuccin', config = config },
}
