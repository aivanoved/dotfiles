return {
    'tpope/vim-abolish',
    'tpope/vim-capslock',
    'tpope/vim-commentary',
    'tpope/vim-eunuch',
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git command line' })
        end,
    },
    'tpope/vim-rhubarb',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    {
        'rbong/vim-flog',
        lazy = true,
        cmd = { 'Flog', 'Flogsplit', 'Floggit' },
        dependencies = {
            'tpope/vim-fugitive',
        },
    },
}
