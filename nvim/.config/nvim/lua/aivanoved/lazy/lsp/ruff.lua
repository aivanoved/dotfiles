local typedef = require('aivanoved.lazy.lsp.typedef')

return typedef.validate_lsp_config({
    lsp_name = 'ruff',
    ensure_installed = true,
    config = {
        init_options = {
            settings = {
                logLevel = 'error',
            }
        },
        on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
        end
    }
})
