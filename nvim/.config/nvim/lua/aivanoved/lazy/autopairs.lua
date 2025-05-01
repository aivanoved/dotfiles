local function config()
    local npairs = require('nvim-autopairs')
    npairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
    })

    local cmp = require('cmp')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return {
    'windwp/nvim-autopairs',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter',
    config = config,
}
