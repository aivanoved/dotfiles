local function mason_config()
    local mason = require('mason')

    mason.setup()
end

local M = {}

M.mason_config = mason_config

return M
