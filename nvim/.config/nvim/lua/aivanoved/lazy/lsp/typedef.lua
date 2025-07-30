--- @class aivanoved.lsp.Config : vim.lsp.Config
--- command string[] that launches the language
--- server (treated as in |jobstart()|, must be absolute or on `$PATH`, shell constructs like
--- "~" are not expanded), or function that creates an RPC client. Function receives
--- a `dispatchers` table and returns a table with member functions `request`, `notify`,
--- `is_closing` and `terminate`.
--- See |vim.lsp.rpc.request()|, |vim.lsp.rpc.notify()|.
---  For TCP there is a builtin RPC client factory: |vim.lsp.rpc.connect()|
--- @field cmd? string[]|fun(dispatchers: vim.lsp.rpc.Dispatchers): vim.lsp.rpc.PublicClient

--- @class aivanoved.lsp.LspConfig
--- (default: nil)
--- @field lsp_name? string|nil
--- (default: false)
--- @field ensure_installed? boolean
--- (default: true)
--- @field super_on_attach? boolean
--- @field config? aivanoved.lsp.Config

local M = {}

--- @return aivanoved.lsp.LspConfig
local function default_lsp_config()
    return {
        ensure_installed = false,
        super_on_attach = true,
        client_config = {},
    }
end

--- @param config aivanoved.lsp.LspConfig
--- @return aivanoved.lsp.LspConfig
local function validate_lsp_config(config)
    local validation_config = vim.deepcopy(config)

    if not validation_config then
        return default_lsp_config()
    end

    -- Type validation
    if type(validation_config) ~= 'table' then
        error('Invalid config type: expected table, got ' .. type(validation_config))
    end

    if validation_config.lsp_name and type(validation_config.lsp_name) ~= 'string' then
        error(
            'Invalid lsp_name type: expected string, got '
            .. type(validation_config.lsp_name)
        )
    end

    if
        validation_config.ensure_installed
        and type(validation_config.ensure_installed) ~= 'boolean'
    then
        error(
            'Invalid ensure_installed type: expected boolean, got '
            .. type(validation_config.ensure_installed)
        )
    end

    if
        validation_config.super_on_attach
        and type(validation_config.super_on_attach) ~= 'boolean'
    then
        error(
            'Invalid ensure_installed type: expected boolean, got '
            .. type(validation_config.ensure_installed)
        )
    end

    if
        validation_config.client_config
        and type(validation_config.client_config) ~= 'table'
    then
        error(
            'Invalid client_config type: expected table, got '
            .. type(validation_config.client_config)
        )
    end

    -- Default values
    validation_config.ensure_installed = validation_config.ensure_installed or false
    validation_config.super_on_attach = validation_config.ensure_installed or true
    validation_config.client_config = validation_config.client_config or {}

    -- Ensure lsp_name is set if ensure_installed is true
    if validation_config.ensure_installed and not validation_config.lsp_name then
        error('lsp_name must be set when ensure_installed is true')
    end

    -- Ensure client_config is a valid LspConfig
    if validation_config.client_config then
        local client_config = validation_config.client_config
        if type(client_config) ~= 'table' then
            error(
                'Invalid client_config type: expected table, got ' .. type(client_config)
            )
        end
    end

    return validation_config
end

M.default_lsp_config = default_lsp_config
M.validate_lsp_config = validate_lsp_config

return M
