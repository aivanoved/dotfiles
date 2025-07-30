local typedef = require('aivanoved.lazy.lsp.typedef')

return typedef.validate_lsp_config({
    lsp_name = 'harper_ls',
    ensure_installed = true,
    config = {
        settings = {
            ['harper-ls'] = {
                linters = {
                    SentenceCapitalization = false,
                }
            }
        }
    }
})
