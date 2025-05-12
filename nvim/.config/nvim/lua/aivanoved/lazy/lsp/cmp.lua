--- @return blink.cmp.Config
local function default_opts()
    local new_opts = vim.empty_dict()

    new_opts.sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {},
    }

    new_opts.completion = {
        keyword = { range = 'full' },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
    }

    new_opts.signature = { enabled = true }

    return new_opts
end

local function cmp_setup()
    local blink = require('blink.cmp')

    local opts = default_opts()

    blink.setup(opts)
end

--- @param capabilities lsp.ClientCapabilities
--- @return lsp.ClientCapabilities
local function cmp_add_capabilities(capabilities)
    local blink = require('blink.cmp')
    return blink.get_lsp_capabilities(capabilities, true)
end

local M = {}

M.cmp_setup = cmp_setup
M.cmp_add_capabilities = cmp_add_capabilities
return M
