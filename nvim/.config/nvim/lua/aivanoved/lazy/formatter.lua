local function config()
    local formatter = require('formatter')

    formatter.setup({
        logging = false,
        log_level = vim.log.levels.WARN,
        filetype = {
            ['rust'] = {
                require('formatter.filetypes.rust').rustfmt,
            },
            ['*'] = {
                require('formatter.filetypes.any').remove_trailing_whitespace,
            },
        },
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    augroup('__formatter__', { clear = true })
    autocmd('BufWritePost', {
        group = '__formatter__',
        command = ':FormatWriteLock',
    })
end

return {
    'mhartington/formatter.nvim',
    config = config,
}
