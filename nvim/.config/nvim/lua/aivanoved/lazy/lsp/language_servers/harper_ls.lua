local lsp_config = require('aivanoved.lazy.lsp.lsp_config')

return lsp_config.validate_lsp_config({
    lsp_name = 'harper_ls',
    ensure_installed = true,
    config = {
        settings = {
            ['harper-ls'] = {
                linters = {
                    SentenceCapitalization = false,
                },
            },
        },
    },
})
