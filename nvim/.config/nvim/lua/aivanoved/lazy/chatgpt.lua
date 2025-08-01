return {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
        require('chatgpt').setup({
            openai_params = {
                model = 'gpt-4.1',
            },
        })
    end,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
}
