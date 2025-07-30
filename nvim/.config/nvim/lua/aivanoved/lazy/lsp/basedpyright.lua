local typedef = require('aivanoved.lazy.lsp.typedef')
local default_config = require('lspconfig.configs.basedpyright')

return typedef.validate_lsp_config({
    lsp_name = 'basedpyright',
    ensure_installed = true,
    config = {
        commands = default_config.commands
    },
})
