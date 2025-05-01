local typedef = require('aivanoved.lazy.lsp.typedef')

return typedef.validate_lsp_config({
    lsp_name = 'rust_analyzer',
    ensure_installed = true,
    client_config = {
        settings = {
            ['rust-analyzer'] = {
                check = {
                    command = 'clippy',
                },
                checkOnSave = {
                    enable = true,
                },
            },
        },
    },
})
