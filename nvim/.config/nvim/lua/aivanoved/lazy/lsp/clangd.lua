local typedef = require('aivanoved.lazy.lsp.typedef')

return typedef.validate_lsp_config({
    lsp_name = 'clangd',
    ensure_installed = true,
})
