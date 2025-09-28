local lsp_config = require('aivanoved.lazy.lsp.lsp_config')

return lsp_config.validate_lsp_config({
    lsp_name = 'rust_analyzer',
    ensure_installed = true,
    super_on_attach = true,
    config = {
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
