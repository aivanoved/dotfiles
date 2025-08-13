--- @type table<vim.diagnostic.Severity, string>
local DIAGNOSTIC_SIGNS = {
    [vim.diagnostic.severity.ERROR] = ' ',
    [vim.diagnostic.severity.WARN] = ' ',
    [vim.diagnostic.severity.INFO] = '󰋽 ',
    [vim.diagnostic.severity.HINT] = '󰌶 ',
}

local NUMBER_LINE_HIGHLIGHT = {
    [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
    [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
    [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
    [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
}

local function lsp_diagnostics()
    --- @type vim.diagnostic.Opts
    local diagnostic_opt = {
        underline = true,
        update_in_insert = true,
        source = true,
        virtual_lines = {
            current_line = true,
            format = function(diagnostic)
                local source = diagnostic.source
                local code = diagnostic.code
                local message = diagnostic.message

                --- @type string
                local output = ""

                if source ~= nil and code ~= nil then
                    output = output .. string.format("%s (%s): ", source, code)
                elseif source ~= nil then
                    output = output .. source .. ": "
                elseif code ~= nil then
                    output = output .. code .. ": "
                end

                if message ~= nil then
                    output = output .. message
                end

                return output
            end
        },
        signs = {
            text = DIAGNOSTIC_SIGNS,
            numhl = NUMBER_LINE_HIGHLIGHT,
        },
        severity_sort = true,
        float = {
            source = true,
        },
    }

    vim.diagnostic.config(diagnostic_opt)
end

local M = {}

M.lsp_diagnostics = lsp_diagnostics

return M
