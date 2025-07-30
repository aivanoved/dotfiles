_SERVER_CONFIG_LIST = {
    require('aivanoved.lazy.lsp.lua_ls'),
    require('aivanoved.lazy.lsp.basedpyright'),
    require('aivanoved.lazy.lsp.typos_lsp'),
    require('aivanoved.lazy.lsp.clangd'),
    require('aivanoved.lazy.lsp.rust_analyzer'),
    require('aivanoved.lazy.lsp.harper_ls'),
}

--- @type table<string, aivanoved.lsp.LspConfig>
SERVER_CONFIGS = {}
for _, config in ipairs(_SERVER_CONFIG_LIST) do
    SERVER_CONFIGS[config.lsp_name] = config
end

--- @return string[]
local function ensure_servers()
    local ensured_servers = {}
    for _, config in pairs(SERVER_CONFIGS) do
        if config.ensure_installed then
            table.insert(ensured_servers, config.lsp_name)
        end
    end
    return ensured_servers
end

--- @param client vim.lsp.Client
--- @param bufnr integer
local function on_attact_inlay(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr })
    vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment' })
end

--- @return aivanoved.lsp.Config
local function default_config()
    return {
        on_attach = on_attact_inlay,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
    }
end

--- @param server string
--- @param server_configs table<string, aivanoved.lsp.LspConfig>
--- @return aivanoved.lsp.Config
local function get_server_config(server, server_configs)
    local cmp = require('aivanoved.lazy.lsp.cmp')

    local server_config = server_configs[server]
    local client_config = server_config.config or default_config()

    client_config.capabilities = cmp.cmp_add_capabilities(client_config.capabilities)

    local user_on_attach = client_config.on_attach
    local super_on_attach = server_config.super_on_attach
    local super_on_attach_function = vim.lsp.config[server].on_attach

    client_config.on_attach = function(client, bufnr)
        if super_on_attach and super_on_attach_function ~= nil then
            super_on_attach_function(client, bufnr)
        end
        on_attact_inlay(client, bufnr)
        if user_on_attach ~= nil then
            user_on_attach(client, bufnr)
        end
    end

    return client_config
end

local function lspconfigure()
    local lspconfig = require('lspconfig')
    local blink = require('blink.cmp')

    -- the documentation of `lsp-zero` suggests
    -- before any of the language servers are set up
    -- you need to add `cmp_nvim_lsp` to `lspconfig` capabilities
    local lspconfig_default = lspconfig.util.default_config
    lspconfig_default.capabilities =
        blink.get_lsp_capabilities(lspconfig_default.capabilities)

    for server, _ in pairs(SERVER_CONFIGS) do
        vim.lsp.config(server, get_server_config(server, SERVER_CONFIGS))
    end

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
        ensure_installed = ensure_servers(),
        automatic_enable = true,
    })
end

local M = {}

M.lspconfigure = lspconfigure

return M
