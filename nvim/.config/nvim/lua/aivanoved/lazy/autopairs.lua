local function config()
    local npairs = require('nvim-autopairs')
    npairs.setup({
        check_ts = true,
        enable_check_bracket_line = false,
    })
end

return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = config,
}
