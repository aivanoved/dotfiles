return {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
        require('chatgpt').setup({
            model = 'gpt-4.1',
        })
    end,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'folke/trouble.nvim', -- optional
        'nvim-telescope/telescope.nvim',
    },
}
