--- @return blink.cmp.Config
local function default_opts()
    --- @type blink.cmp.Config
    local new_opts = vim.empty_dict()

    new_opts.sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    }

    new_opts.fuzzy = {
        sorts = {
            'exact',
            'score',
            'sort_text',
        }
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

    new_opts.completion.menu = {
        direction_priority = function()
            local cmp = require('blink.cmp')
            local ctx = cmp.get_context()
            local item = cmp.get_selected_item()

            if ctx == nil or item == nil then
                return { 's', 'n' }
            end

            local item_text = item.textEdit ~= nil and item.textEdit.newText or item.insertText or item.label
            local is_multi_line = item_text:find('\n') ~= nil

            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
                vim.g.blink_cmp_upwards_ctx_id = ctx.id
                return { 'n', 's' }
            end
            return { 's', 'n' }
        end,
        draw = {
            components = {
                kind_icon = {
                    text = function(ctx)
                        local icon = ctx.kind_icon
                        if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                            local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                            icon = dev_icon or icon
                        end
                        return icon .. ctx.icon_gap
                    end
                }
            }
        }
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
