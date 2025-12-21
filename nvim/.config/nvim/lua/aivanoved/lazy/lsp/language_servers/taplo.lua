local lsp_config = require('aivanoved.lazy.lsp.lsp_config')

return lsp_config.validate_lsp_config({
    lsp_name = 'taplo',
    ensure_installed = true,
})
