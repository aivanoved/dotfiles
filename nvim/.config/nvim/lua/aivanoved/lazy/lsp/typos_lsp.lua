local typedef = require('aivanoved.lazy.lsp.typedef')

return typedef.validate_lsp_config({
    lsp_name = 'typos_lsp',
    ensure_installed = true,
    client_config = {
        cmd_env = { RUST_LOG = 'error' },
        init_options = {
            diagnosticSeverity = 'Error',
        },
    },
})
