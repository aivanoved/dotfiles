local function linter_config()
    local nvim_lint = require('lint')

    nvim_lint.linters_by_ft['python'] = { 'ruff' }
end

--- @type aivanoved.lsp.LinterConfig
local M = {
    linter_name = 'ruff',
    linter_config = linter_config,
}

return M
