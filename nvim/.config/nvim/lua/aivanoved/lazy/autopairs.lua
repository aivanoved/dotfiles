local function config()
    local npairs = require('nvim-autopairs')
    npairs.setup({
        fast_wrap = {},
    })

    local cmp = require('cmp')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return {
    'windwp/nvim-autopairs',
    dependecies = {
        'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter',
    config = config,
}
