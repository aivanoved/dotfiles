--- @class aivanoved.lsp.LinterConfig
--- @field linter_name string
--- @field linter_config fun(): nil

--- @type table<integer, aivanoved.lsp.LinterConfig>
local LINTERS = {
    require('aivanoved.lazy.lsp.linters.ruff'),
}

local function linters_configure()
    for _, value in ipairs(LINTERS) do
        value.linter_config()
    end
end

return {
    linters_configure = linters_configure,
}
