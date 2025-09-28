local lsp_config = require('aivanoved.lazy.lsp.lsp_config')

return lsp_config.validate_lsp_config({
    lsp_name = 'ruff',
    ensure_installed = true,
    config = {
        init_options = {
            settings = {
                logLevel = 'error',
            },
        },
        on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
        end,
    },
})
